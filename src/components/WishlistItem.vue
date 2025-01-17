<script lang="ts" setup>
import { useI18n } from 'vue-i18n'
import IconCart from './icons/IconCart.vue'
import { WishlistItem } from '@/types'
const props = defineProps<{
  item: WishlistItem
}>()
const { t } = useI18n()

const openUrl = (): void => {
  props.item.url && window?.open(props.item.url, '_blank')?.focus()
}
</script>

<template>
  <div
    class="flex h-fit flex-col space-x-0 overflow-hidden rounded-md border-2 border-stone-200 dark:border-stone-700 sm:h-40 sm:flex-row sm:space-x-2"
  >
    <ImagePreview
      class="max-h-44 flex-shrink-0 flex-grow-0 object-cover sm:w-1/4"
      :src="item.imageSrc"
      :alt="item.title"
      :class="{ 'cursor-pointer': item.url }"
      @click.prevent="openUrl()"
      data-test="preview-image"
    />

    <div class="flex flex-col justify-between p-2">
      <div>
        <h1
          @click.prevent="openUrl()"
          class="mb-1 text-lg font-bold"
          :class="{ 'cursor-pointer': item.url }"
          data-test="title"
        >
          {{ item.title }}
        </h1>
        <p
          @click.prevent="openUrl()"
          class="text-sm sm:line-clamp-3"
          :class="{ 'cursor-pointer': item.url }"
          data-test="descriptions"
        >
          {{ item.description }}
        </p>
      </div>
      <div
        class="mt-4 flex w-full flex-row flex-wrap-reverse items-baseline sm:mt-2"
      >
        <ButtonBase
          class="mr-4 mt-4 text-xs sm:mt-0"
          :icon="IconCart"
          @click="$emit('bought')"
          data-test="bought-button"
          >{{ t('components.wishlist-item.bought-button.text') }}</ButtonBase
        >
        <a
          v-if="item.url"
          :href="item.url"
          target="_blank"
          rel="noopener"
          data-test="link"
          class="flex w-fit flex-row items-center text-sm text-stone-500 dark:text-white/60"
        >
          <IconLink class="mr-1 h-4 w-4 fill-stone-500 dark:fill-white/60" />
          <span>{{
            t('components.wishlist-item.external-product-page-link.text')
          }}</span>
        </a>
      </div>
    </div>
  </div>
</template>
