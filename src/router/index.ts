
import { createRouter, createWebHistory } from 'vue-router';

const routes = [
  { path: '/', component: () => import('../pages/Index.vue') },
  { path: '/apps', component: () => import('../pages/Apps.vue') },
  { path: '/games', component: () => import('../pages/Games.vue') },
  { path: '/utilities', component: () => import('../pages/Utilities.vue') },
  { path: '/foundation', component: () => import('../pages/Foundation.vue') },
  { path: '/ethics', component: () => import('../pages/Ethics.vue') },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
