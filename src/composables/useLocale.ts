import { useI18n } from "vue-i18n";

export type Locale = "en" | "ru";

export function useLocale() {
  const i18n = useI18n();

  const setLocale = (newLocale: Locale) => {
    i18n.locale.value = newLocale;
    if (typeof window !== "undefined") {
      localStorage.setItem("locale", newLocale);
    }
  };

  const initLocale = () => {
    if (typeof window !== "undefined") {
      const savedLocale = localStorage.getItem("locale") as Locale;
      if (savedLocale && ["en", "ru"].includes(savedLocale)) {
        i18n.locale.value = savedLocale;
      } else {
        const browserLang = navigator.language.split("-")[0];
        if (browserLang === "ru") {
          i18n.locale.value = "ru";
        } else {
          i18n.locale.value = "en";
        }
      }
    }
  };

  return {
    setLocale,
    initLocale,
    locale: i18n.locale,
    t: i18n.t,
  };
}
