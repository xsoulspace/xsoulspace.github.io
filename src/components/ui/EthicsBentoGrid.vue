<script setup lang="ts">
import type { Project } from "@/types/project";

defineProps<{
  items: Project[];
}>();

// Group items by their purpose for better organization
const getAccentColor = (accent: string) => {
  const colors = {
    blue: "var(--color-primary)", // E07A5F - warm orange/salmon
    purple: "var(--color-secondary)", // 81B29A - sage green
    green: "var(--color-highlight)", // F2CC8F - warm yellow/gold
    orange: "var(--color-accent)", // F2CC8F - warm yellow/gold
  };
  return colors[accent as keyof typeof colors] || colors.blue;
};
</script>

<template>
  <div class="ethics-bento-container">
    <div class="ethics-bento-grid">
      <div
        v-for="item in items"
        :key="item.id"
        class="ethics-bento-item"
        :class="[
          `size-${item.bentoConfig?.size || 'small'}`,
          `accent-${item.bentoConfig?.accent || 'blue'}`,
        ]"
        :style="{
          '--accent-color': getAccentColor(item.bentoConfig?.accent || 'blue'),
        }"
      >
        <div class="item-content">
          <h3 class="item-title">{{ item.title }}</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.ethics-bento-container {
  position: relative;
  max-width: 1000px;
  margin: 0 auto;
  padding: var(--spacing-lg);
}

.ethics-bento-grid {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  grid-template-rows: repeat(4, 70px);
  gap: 8px;
  position: relative;
  z-index: 1;
}

.ethics-bento-item {
  position: relative;
  border-radius: 6px;
  overflow: hidden;
  background: linear-gradient(
    135deg,
    rgba(247, 242, 233, 0.8) 0%,
    rgba(240, 235, 225, 0.9) 100%
  );
  border: 1px solid rgba(220, 211, 197, 0.6);
  border-bottom: 2px solid rgba(200, 190, 180, 0.4);
  border-right: 1px solid rgba(230, 220, 210, 0.3);
  transition: all 0.3s ease;
  cursor: pointer;
}

.ethics-bento-item:hover {
  background: linear-gradient(
    135deg,
    rgba(247, 242, 233, 0.9) 0%,
    rgba(240, 235, 225, 1) 100%
  );
  border-color: rgba(224, 122, 95, 0.4);
  border-bottom: 2px solid rgba(224, 122, 95, 0.3);
}

/* Specific grid positioning to match the image layout */
.ethics-bento-item:nth-child(1) {
  grid-column: 1 / 2;
  grid-row: 1 / 2;
} /* Apps */
.ethics-bento-item:nth-child(2) {
  grid-column: 2 / 4;
  grid-row: 1 / 2;
} /* Ethics & Values */
.ethics-bento-item:nth-child(3) {
  grid-column: 4 / 6;
  grid-row: 1 / 2;
} /* Games */
.ethics-bento-item:nth-child(4) {
  grid-column: 1 / 2;
  grid-row: 2 / 3;
} /* Convenience */
.ethics-bento-item:nth-child(5) {
  grid-column: 2 / 3;
  grid-row: 2 / 3;
} /* Simplicity */
.ethics-bento-item:nth-child(6) {
  grid-column: 3 / 6;
  grid-row: 2 / 3;
} /* Usefulness */
.ethics-bento-item:nth-child(7) {
  grid-column: 1 / 2;
  grid-row: 3 / 4;
} /* Safety */
.ethics-bento-item:nth-child(8) {
  grid-column: 2 / 4;
  grid-row: 3 / 4;
} /* Longevity */
.ethics-bento-item:nth-child(9) {
  grid-column: 4 / 5;
  grid-row: 3 / 4;
} /* Creativity */
.ethics-bento-item:nth-child(10) {
  grid-column: 5 / 6;
  grid-row: 3 / 4;
} /* Fun */
.ethics-bento-item:nth-child(11) {
  grid-column: 1 / 4;
  grid-row: 4 / 5;
} /* Usefulness */
.ethics-bento-item:nth-child(12) {
  grid-column: 4 / 5;
  grid-row: 4 / 5;
} /* Challenge */
.ethics-bento-item:nth-child(13) {
  grid-column: 5 / 6;
  grid-row: 4 / 5;
} /* Style */

.item-content {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 8px 12px;
}

.item-title {
  font-family: var(--font-family);
  font-size: clamp(11px, 2vw, 14px);
  font-weight: 400;
  color: rgba(78, 52, 46, 0.8);
  text-align: center;
  line-height: 1.2;
  margin: 0;
}

/* Color variations for different accents */
.accent-blue .item-title {
  color: rgba(78, 52, 46, 0.9);
  font-weight: 400;
}
.accent-purple .item-title {
  color: rgba(78, 52, 46, 0.9);
  font-weight: 400;
}
.accent-green .item-title {
  color: rgba(78, 52, 46, 0.9);
  font-weight: 400;
}

/* Responsive Design */
@media (max-width: 1200px) {
  .ethics-bento-grid {
    grid-template-columns: repeat(4, 1fr);
    grid-template-rows: repeat(5, 60px);
  }

  .ethics-bento-item:nth-child(1) {
    grid-column: 1 / 2;
    grid-row: 1 / 2;
  }
  .ethics-bento-item:nth-child(2) {
    grid-column: 2 / 4;
    grid-row: 1 / 2;
  }
  .ethics-bento-item:nth-child(3) {
    grid-column: 4 / 5;
    grid-row: 1 / 2;
  }
  .ethics-bento-item:nth-child(4) {
    grid-column: 1 / 2;
    grid-row: 2 / 3;
  }
  .ethics-bento-item:nth-child(5) {
    grid-column: 2 / 3;
    grid-row: 2 / 3;
  }
  .ethics-bento-item:nth-child(6) {
    grid-column: 3 / 5;
    grid-row: 2 / 3;
  }
  .ethics-bento-item:nth-child(7) {
    grid-column: 1 / 2;
    grid-row: 3 / 4;
  }
  .ethics-bento-item:nth-child(8) {
    grid-column: 2 / 4;
    grid-row: 3 / 4;
  }
  .ethics-bento-item:nth-child(9) {
    grid-column: 4 / 5;
    grid-row: 3 / 4;
  }
  .ethics-bento-item:nth-child(10) {
    grid-column: 1 / 2;
    grid-row: 4 / 5;
  }
  .ethics-bento-item:nth-child(11) {
    grid-column: 2 / 4;
    grid-row: 4 / 5;
  }
  .ethics-bento-item:nth-child(12) {
    grid-column: 4 / 5;
    grid-row: 4 / 5;
  }
  .ethics-bento-item:nth-child(13) {
    grid-column: 1 / 3;
    grid-row: 5 / 6;
  }
}

@media (max-width: 768px) {
  .ethics-bento-container {
    padding: var(--spacing-md);
  }

  .ethics-bento-grid {
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: repeat(8, 55px);
    gap: 6px;
  }

  .ethics-bento-item:nth-child(1) {
    grid-column: 1 / 2;
    grid-row: 1 / 2;
  }
  .ethics-bento-item:nth-child(2) {
    grid-column: 2 / 3;
    grid-row: 1 / 3;
  }
  .ethics-bento-item:nth-child(3) {
    grid-column: 1 / 2;
    grid-row: 2 / 3;
  }
  .ethics-bento-item:nth-child(4) {
    grid-column: 1 / 2;
    grid-row: 3 / 4;
  }
  .ethics-bento-item:nth-child(5) {
    grid-column: 2 / 3;
    grid-row: 3 / 4;
  }
  .ethics-bento-item:nth-child(6) {
    grid-column: 1 / 3;
    grid-row: 4 / 5;
  }
  .ethics-bento-item:nth-child(7) {
    grid-column: 1 / 2;
    grid-row: 5 / 6;
  }
  .ethics-bento-item:nth-child(8) {
    grid-column: 2 / 3;
    grid-row: 5 / 6;
  }
  .ethics-bento-item:nth-child(9) {
    grid-column: 1 / 2;
    grid-row: 6 / 7;
  }
  .ethics-bento-item:nth-child(10) {
    grid-column: 2 / 3;
    grid-row: 6 / 7;
  }
  .ethics-bento-item:nth-child(11) {
    grid-column: 1 / 3;
    grid-row: 7 / 8;
  }
  .ethics-bento-item:nth-child(12) {
    grid-column: 1 / 2;
    grid-row: 8 / 9;
  }
  .ethics-bento-item:nth-child(13) {
    grid-column: 2 / 3;
    grid-row: 8 / 9;
  }

  .item-title {
    font-size: clamp(12px, 3vw, 14px);
  }
}

@media (max-width: 480px) {
  .ethics-bento-grid {
    grid-template-columns: 1fr;
    grid-template-rows: repeat(13, 50px);
  }

  .ethics-bento-item:nth-child(1) {
    grid-column: 1;
    grid-row: 1;
  }
  .ethics-bento-item:nth-child(2) {
    grid-column: 1;
    grid-row: 2;
  }
  .ethics-bento-item:nth-child(3) {
    grid-column: 1;
    grid-row: 3;
  }
  .ethics-bento-item:nth-child(4) {
    grid-column: 1;
    grid-row: 4;
  }
  .ethics-bento-item:nth-child(5) {
    grid-column: 1;
    grid-row: 5;
  }
  .ethics-bento-item:nth-child(6) {
    grid-column: 1;
    grid-row: 6;
  }
  .ethics-bento-item:nth-child(7) {
    grid-column: 1;
    grid-row: 7;
  }
  .ethics-bento-item:nth-child(8) {
    grid-column: 1;
    grid-row: 8;
  }
  .ethics-bento-item:nth-child(9) {
    grid-column: 1;
    grid-row: 9;
  }
  .ethics-bento-item:nth-child(10) {
    grid-column: 1;
    grid-row: 10;
  }
  .ethics-bento-item:nth-child(11) {
    grid-column: 1;
    grid-row: 11;
  }
  .ethics-bento-item:nth-child(12) {
    grid-column: 1;
    grid-row: 12;
  }
  .ethics-bento-item:nth-child(13) {
    grid-column: 1;
    grid-row: 13;
  }
}

/* Dark mode enhancements */
@media (prefers-color-scheme: dark) {
  .ethics-bento-container::before {
    background: radial-gradient(
        circle at 20% 30%,
        rgba(224, 122, 95, 0.04) 0%,
        transparent 50%
      ),
      radial-gradient(
        circle at 80% 70%,
        rgba(129, 178, 154, 0.04) 0%,
        transparent 50%
      ),
      radial-gradient(
        circle at 40% 90%,
        rgba(242, 204, 143, 0.04) 0%,
        transparent 50%
      );
  }

  .ethics-bento-item {
    background: linear-gradient(
      135deg,
      rgba(78, 52, 46, 0.1) 0%,
      rgba(85, 60, 50, 0.15) 100%
    );
    border: 1px solid rgba(220, 211, 197, 0.2);
    border-bottom: 2px solid rgba(180, 160, 140, 0.3);
    border-right: 1px solid rgba(200, 180, 160, 0.2);
  }

  .ethics-bento-item:hover {
    background: linear-gradient(
      135deg,
      rgba(78, 52, 46, 0.15) 0%,
      rgba(85, 60, 50, 0.2) 100%
    );
    border-color: rgba(224, 122, 95, 0.3);
    border-bottom: 2px solid rgba(224, 122, 95, 0.2);
  }

  .item-title {
    color: rgba(250, 246, 240, 0.8);
  }
}
</style>
