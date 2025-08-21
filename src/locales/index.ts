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

// Custom composable for convenience
export function useLocale() {
  const { t, locale } = i18n.global;

  const setLocale = (newLocale: Locale) => {
    locale.value = newLocale;
    if (typeof window !== "undefined") {
      localStorage.setItem("locale", newLocale);
    }
  };

  const initLocale = () => {
    if (typeof window !== "undefined") {
      const savedLocale = localStorage.getItem("locale") as Locale;
      if (savedLocale && (savedLocale === "en" || savedLocale === "ru")) {
        locale.value = savedLocale;
      } else {
        const browserLang = navigator.language.split("-")[0];
        if (browserLang === "ru") {
          locale.value = "ru";
        } else {
          locale.value = "en";
        }
      }
    }
  };

  return {
    t,
    locale,
    setLocale,
    initLocale,
  };
}
