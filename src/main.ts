import "@fortawesome/fontawesome-free/css/all.css";
import { createHead } from "@vueuse/head";
import { createApp } from "vue";
import App from "./App.vue";
import "./assets/main.css";
import i18n from "./locales";
import router from "./router";

const app = createApp(App);
const head = createHead();

app.use(head);
app.use(router);
app.use(i18n);

app.mount("#app");
