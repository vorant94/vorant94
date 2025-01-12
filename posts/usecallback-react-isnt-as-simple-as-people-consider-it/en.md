# useCallback - React isn't as simple as people think it is

*Recently I switched camps from Angular to React. Comparing these two technologies head-to-head is quite naive thing to do. There is a long-standing perception in the tech world, that React may lack some features, but it is simple and elegant, while Angular is complex and heavy, but it is a "batteries included" solution. Without experience with react I had nothing to do with this perception, but now it changed. I don't agree, that React is simple and `useCallback` is my proof*

---

## What is a UI in React's view

In the post [The Two Reacts](https://overreacted.io/the-two-reacts/) Dan Abramov gives a mindset behind React as something dual: from one side UI is a derivative of the app state, from another - it is a derivative of data, fetched from a server. It indeed sounds very simple and elegant especially after migration from class-based components to function-based components since the term "function" literally means "function".

In this blog I use React's JSX to decompose interface into reusable small pieces. To minimize client-side JS, the server renders all this React into HTML string and responds with it. Request handler consists from collecting the required data and passing it to a three of higher-order JSX functions. In the system like this it is easy to understand what where and when happens: finding a target piece of code always starts from the top and goes strictly down the tree without need to jump across different branches left or right. The only term really required for the job is a "function"/"derivative", nothing else.

Recently I started to work on a small pet-project and chose this time a fully-fledged client-side React as a basis, because here i needed a lot more interactive UI compared to this blog. Almost immediately i realised, that mindset "UI is a derivative of app state / data from a server" isn't enough, real code goes out of it very fast.

## First case: works correctly, but has excessive computations

```tsx
export const Counter: FC = () => {
  const [counter, setCounter] = useState(0);

  const logCounter = () => {
    console.log(`Count is: ${counter}`);
  };

  const increaseCounter = () => {
    setCounter(counter + 1);
  };

  return (
    <div className="flex flex-col gap-2 items-start">
      <p>{counter}</p>
      <button onClick={increaseCounter}>Increase Counter</button>
      <button onClick={logCounter}>Log Counter</button>
    </div>
  );
};
```

Lets look into this component. Component has state to store current value of the counter, `div` to show it and a couple of buttons to somehow interact with it. Everything is as straightforward as it can be, but any JS dev would notice here performance issues. In the current implementation every render cycle of the component (meaning execution of `Counter` function) creates new instances of functions `logCounter` and `increaseCounter`. The code of these functions doesn't change from render to render, but instances from the previous render cycles are thrown in to garbage collector adding load to the browser. Let's say you have 100 components like this on the screen, it means that besides 100 instances of `Counter` itself we store in the memory 100 instances of `logCounter` and 100 instances of `increaseCounter`, 300 instances in total. Each re-render is a clean up of 300 variables and creation of 300 new variables (if all the 100 components were changed between renders of course). React authors clearly see this issue, therefore they propose a solution - built-in `useCallback` hook, that knows to persist function instance between re-renders.

## Second case: works incorrectly, but minimal computations

```tsx
export const Counter: FC = () => {
  const [counter, setCounter] = useState(0);

  const logCounter = useCallback(() => {
    console.log(`Count is: ${counter}`);
  }, []);

  const increaseCounter = useCallback(() => {
    setCounter(counter + 1);
  }, []);

  return (
    <div className="flex flex-col gap-2 items-start">
      <p>{counter}</p>
      <button onClick={increaseCounter}>Increase Counter</button>
      <button onClick={logCounter}>Log Counter</button>
    </div>
  );
};
```

It looks something like this. This time any dev familiar with React would alarm: empty dependency arrays of `useCallback` (because of which instances of `logCounter` and `increaseCounter` are created only once)! The thing is that React hooks are immutable, meaning that on each render we are getting not only new instance of our functions (without usage of `useCallback`) but also state (`counter` and `setCounter`) is created again. The value of a state of course is persisted across render cycles, but pointers to memory are already new. Because of closure without creating new instances, old instanced of functions are in use, and they use old values. For more clarity if we run this component we get the following result:

- initially `counter` is rendered as 0
- when we click on "Increase Counter" `counter` is incremented by 1, but consequent button clicks have no effect. The reason for it is that `increaseCounter` uses pointer to an old value of 0 and 0+1=1
- when we click "Log Counter" we see only only zeros in the console regardless of what is shown on the screen (0 or 1). The reason for it is that `logCounter` also uses old value of 0

To simultaneously avoid creation of excessive instances and to have the valid instances we need to tell to React, that when `counter` value changes it needs to re-create functions as well meaning we need to add dependency array of `useCallback`.

## Third case: works correctly, but computations...

```tsx
export const Counter: FC = () => {
  const [counter, setCounter] = useState(0);

  const logCounter = useCallback(() => {
    console.log(`Count is: ${counter}`);
  }, [counter]);

  const increaseCounter = useCallback(() => {
    setCounter(counter + 1);
  }, [counter, setCounter]);

  return (
    <div className="flex flex-col gap-2 items-start">
      <p>{counter}</p>
      <button onClick={increaseCounter}>Increase Counter</button>
      <button onClick={logCounter}>Log Counter</button>
    </div>
  );
};
```

At last we got to good quality React component, but if we look back we can notice that something odd now. Why do we have to re-create functions (or behavior in other words) of the component when it's state changes?!

## "А ручки-то вот они!" ©️

В JS наследование реализовано через прототипирование. Допустим, мы создали класс `Person` с полями `firstName` и `lastName`  и методом `getFullName`. Каждый инстанс этого класса имеет свои собственные `firstName` и `lastName`. Однако в то же время все они ссылаются на один единственный `getFullName`, который живет на прототипе нашего класса, а не на конкретном инстансе. Как же этот отдельно стоящий `getFullName` знает, что он вызван в контексте инстанса `person1`, а не `person2`? При помощи `this.`! Но React отказался от компонентов в виде классов давным давно, поэтому у нас нет `this.` в компонентах-функциях, поэтому авторам реакта пришлось находить решение в массиве зависимостей хука `useCallback`. И мне это кое-что напоминает.

Допустим, у нас есть како-то другой стейт, который зависит от `counter`. Назовем его `doubleCounter`, он по определению должен обновляться каждый раз, когда обновляется `counter` и React отлично с этим справляется посредством `useMemo` хука. А теперь сравните схематически использование `useCallback` и `useMemo`. Они одинаковы с точки зрения компонента! `increaseCounter` и `logCounter` по сути отвечают за описание **поведения компонента**, но он к ним относится будто они очередной его **стейт** (как `doubleCounter`), который надо обновлять исходя из зависимостей, и который надо отдельно хранить в каждом инстансе компонента!

Я не знаю, какие проблемы возникали у авторов реакта, из-за которых они решили полностью отказаться от компонентов-классов. С удовольствием послушаю про это, если тут есть кто-то сведующий. Но это не меняет нашей реальности, в которой компонент - это не только производная от стейта или данных, но еще и поведение, связанное с ним. Отрицание этого будь-то осознанное или нет приводит к тому, что на бумаге терминов вроде как меньше (нет ни директив, ни сервисов, ни модулей как в том же Angular), но на практике в этот ограниченный набор категорий приходится засовывать ровно тоже количество понятий. Less is not always more

```tsx
export const Counter: FC = () => {
  const [counter, setCounter] = useState(0);

  const doubleCounter = useMemo(() => counter * 2, [counter]);

  const logCounter = useCallback(() => {
    console.log(`Count is: ${counter}`);
  }, [counter]);

  const increaseCounter = useCallback(() => {
    setCounter(counter + 1);
  }, [counter, setCounter]);

  return (
    <div className="flex flex-col gap-2 items-start">
      <p>{counter}</p>
      <p>{doubleCounter}</p>
      <button onClick={increaseCounter}>Increase Counter</button>
      <button onClick={logCounter}>Log Counter</button>
    </div>  );
};
```

---

Upd. по теме:

Оказывается, между первым и последним примерами разницы в продуктивности нет (по крайней мере в плане garbage collection)…

Суть в том как технически `useCallback` (а так же `useState`) работает:

- на первом рендере, прогоне компонента-функции, он берет и использует переданное ему начальное значение
- на последующих рендерах начальное значение по-прежнему создается в памяти, так как компонент - это просто JS функция, но хук инорирует его и возвращает ссылку на то самое изначальное значение

Когда, да, есть смысл использовать `useCallback`? Когда его надо передать в дочерний компонент или в какой-нибудь кастомный хук. Если дочерний компонент обернут в `memo` или функция упомянута в зависимостях кастомного хука, то дочерний компонент и/или кастомный хук не будут прогоняться почем зря. В родительском же компоненте разницы ноль.

То есть как ни крути все равно лишние десятки и сотни инстансов функций будут создаваться и тут же чистится через garbage collection. Я вообще удивлен, как подобная парадигма может быть продуктивной, но, да, стоит по-внимательнее читать доки😕
