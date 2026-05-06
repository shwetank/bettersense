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
						{ label: 'Catalog', slug: 'agents/catalog' },
					],
				},
				{
					label: 'Guides',
					items: [
						{ label: 'Scheduling routines', slug: 'guides/scheduling' },
						{ label: 'Stakeholder reflection', slug: 'guides/worked-example-stakeholder' },
						{ label: 'Wins curation', slug: 'guides/worked-example-wins' },
						{ label: 'Profile & strategy', slug: 'guides/profile-and-strategy' },
					],
				},
				{
					label: 'Reference',
					items: [
						{ label: 'Environment variables', slug: 'reference/env-vars' },
						{ label: 'File locations', slug: 'reference/file-locations' },
						{ label: 'License', slug: 'reference/license' },
					],
				},
			],
		}),
	],
});
