import { clearProjectCache } from "@/services/projectService";
import { ref, watch } from "vue";
import { useI18n } from "vue-i18n";

export function useLocale() {
  const { locale, t } = useI18n();
  const currentLocale = ref(locale.value);

  // Watch for locale changes and clear project cache
  watch(locale, (newLocale) => {
    currentLocale.value = newLocale;
    // Clear project cache when locale changes to ensure fresh data
    clearProjectCache();
  });

  const setLocale = (newLocale: string) => {
    locale.value = newLocale;
    localStorage.setItem("locale", newLocale);
  };

  return {
    locale: currentLocale,
    t,
    setLocale,
  };
}
