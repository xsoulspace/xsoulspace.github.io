import { clearProjectCache } from "@/services/projectService";
import { ref, watch } from "vue";
import { useI18n } from "vue-i18n";

export type Locale = "en" | "ru";

export function useLocale() {
  const { locale, t } = useI18n();
  const currentLocale = ref(locale.value);

  // Watch for locale changes and clear project cache
  watch(locale, (newLocale) => {
    currentLocale.value = newLocale;
    // Clear project cache when locale changes to ensure fresh data
    clearProjectCache();
  });

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
    locale: currentLocale,
    t,
    setLocale,
    initLocale,
  };
}
