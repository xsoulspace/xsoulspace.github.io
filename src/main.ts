import "@fortawesome/fontawesome-free/css/all.css";
import { createApp } from "vue";
import App from "./App.vue";
import "./assets/main.css";
import i18n from "./locales";
import router from "./router";

const app = createApp(App);

app.use(router);
app.use(i18n);

app.mount("#app");
