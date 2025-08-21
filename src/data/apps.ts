import type { Project } from '../types/project';

export const apps: Project[] = [
  {
    id: 'daily_budget_planner',
    title: 'Daily Budget Planner',
    subtitle: 'Plan Finances ahead',
    description: 'An application to help manage your daily budget.',
    repository: 'https://github.com/xsoulspace/daily_budget_planner',
    tags: ['flutter', 'finance', 'budgeting'],
    media: { type: 'image', url: '' },
    links: [],
  },
  {
    id: 'last_answer',
    title: 'Last Answer',
    subtitle: 'Fast notebook & Idea maker',
    description: 'An app for quickly writing down ideas and notes.',
    repository: 'https://github.com/xsoulspace/last_answer',
    tags: ['flutter', 'notes', 'ideas', 'cross-platform'],
    media: { type: 'image', url: '/src/assets/icons/icon_last_answer.png' },
    links: [],
  },
];