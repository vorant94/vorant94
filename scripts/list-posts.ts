import { glob } from "node:fs/promises";
import { styleText } from "node:util";
import { format } from "date-fns";
import { readJSON } from "fs-extra/esm";
import { z } from "zod";

const frontmatterSchema = z.object({
	title: z.string(),
	description: z.string(),
	publishedAt: z.coerce.date(),
	related: z.array(z.string()).optional(),
	codeUrl: z.string().url().optional(),
});

const frontmatters: Array<z.infer<typeof frontmatterSchema>> = [];
for await (const frontmatter of glob("posts/**/frontmatter.json")) {
	const raw = await readJSON(frontmatter);
	const parsed = frontmatterSchema.parse(raw);
	frontmatters.push(parsed);
}

const sorted = frontmatters.toSorted((a, b) =>
	a.publishedAt < b.publishedAt ? -1 : 1,
);
const grouped = Object.groupBy(sorted, (frontmatter) =>
	frontmatter.publishedAt.getFullYear(),
);
for (const [year, frontmattersByYear] of Object.entries(grouped)) {
	if (!frontmattersByYear) {
		continue;
	}

	console.info(`--- ${year} ---`);
	for (const frontmatter of frontmattersByYear) {
		console.info(
			`${styleText("cyan", format(frontmatter.publishedAt, "yyyy-MM-dd"))} - ${styleText("green", frontmatter.title)}`,
		);
	}
}
