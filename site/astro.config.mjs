// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	site: 'https://bettersense.ai',
	integrations: [
		starlight({
			title: 'bettersense',
			description: 'Skills and agents for AI PMs, engineering managers, TPMs, and senior ICs — inside Claude Code.',
			social: [
				{ icon: 'github', label: 'GitHub', href: 'https://github.com/shwetank/bettersense' },
			],
			head: [
				{
					tag: 'link',
					attrs: { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
				},
				{
					tag: 'link',
					attrs: { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: 'anonymous' },
				},
				{
					tag: 'link',
					attrs: {
						rel: 'stylesheet',
						href: 'https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,400..700&family=Inter:wght@400..600&display=swap',
					},
				},
			],
			customCss: ['./src/styles/custom.css'],
			defaultLocale: 'root',
			locales: {
				root: { label: 'English', lang: 'en' },
			},
			sidebar: [
				{
					label: 'Getting started',
					items: [
						{ label: 'Install', slug: 'getting-started/install' },
						{ label: 'First run', slug: 'getting-started/first-run' },
						{ label: 'How skills work', slug: 'getting-started/how-skills-work' },
						{ label: 'See it in action', slug: 'getting-started/examples' },
					],
				},
				{
					label: 'Who it\'s for',
					items: [
						{ label: 'AI Product Managers', slug: 'for/ai-pms' },
						{ label: 'Engineering Managers', slug: 'for/engineering-managers' },
						{ label: 'TPMs', slug: 'for/tpms' },
						{ label: 'Senior ICs', slug: 'for/senior-ics' },
					],
				},
				{
					label: 'Tutorials',
					items: [
						{ label: 'Overview', slug: 'tutorials' },
						{ label: 'Set up your profile', slug: 'tutorials/setup-profile' },
						{ label: 'Set up your stakeholder radar', slug: 'tutorials/stakeholder-radar' },
						{ label: 'Log a win and turn it into a story', slug: 'tutorials/log-a-win' },
						{ label: 'Sanity-check an AI feature', slug: 'tutorials/ai-feature-check' },
						{ label: 'The Friday leadership review', slug: 'tutorials/friday-review' },
						{ label: 'Build a promotion case', slug: 'tutorials/promo-case' },
						{ label: 'Navigate underperformance', slug: 'tutorials/underperformance' },
					],
				},
				{
					label: 'Skills',
					items: [
						{ label: 'Overview', slug: 'skills/overview' },
						{ label: 'Stakeholder management', slug: 'skills/stakeholder-management' },
						{ label: 'Wins system', slug: 'skills/wins-system' },
						{ label: 'Strategy', slug: 'skills/strategy' },
						{ label: 'AI product craft', slug: 'skills/ai-product-craft' },
						{ label: 'People leadership', slug: 'skills/people-leadership' },
						{ label: 'Cross-cutting', slug: 'skills/cross-cutting' },
					],
				},
				{
					label: 'Agents',
					items: [
						{ label: 'Overview', slug: 'agents/overview' },
						{ label: 'AI product workflow', slug: 'agents/ai-product-workflow' },
						{ label: 'Docs & communication', slug: 'agents/docs-and-communication' },
						{ label: 'Engineering reliability', slug: 'agents/engineering-reliability' },
						{ label: 'Research & programs', slug: 'agents/research-and-programs' },
						{ label: 'Operations & people', slug: 'agents/operations-people' },
						{ label: 'Catalog', slug: 'agents/catalog' },
					],
				},
				{
					label: 'Guides',
					items: [
						{ label: 'Scheduling routines', slug: 'guides/scheduling' },
						{ label: 'Using bettersense as a team', slug: 'guides/team-workspace' },
						{ label: 'Stakeholder reflection', slug: 'guides/worked-example-stakeholder' },
						{ label: 'Wins curation', slug: 'guides/worked-example-wins' },
						{ label: 'Profile & strategy', slug: 'guides/profile-and-strategy' },
					],
				},
				{
					label: 'Reference',
					items: [
						{ label: 'Your data', slug: 'reference/your-data' },
						{ label: 'We eval our own skills', slug: 'reference/evals' },
						{ label: 'Environment variables', slug: 'reference/env-vars' },
						{ label: 'File locations', slug: 'reference/file-locations' },
						{ label: 'License', slug: 'reference/license' },
					],
				},
			],
		}),
	],
});
