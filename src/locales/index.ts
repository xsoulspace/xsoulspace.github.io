import { createI18n } from "vue-i18n";
import { en } from "./en";
import { ru } from "./ru";

export type Locale = "en" | "ru";

const i18n = createI18n({
  legacy: false, // Use Composition API
  locale: "en", // set locale
  fallbackLocale: "en", // set fallback locale
  messages: {
    en,
    ru,
  },
});

export default i18n;
