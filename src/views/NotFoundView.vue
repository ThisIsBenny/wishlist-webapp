<script setup lang="ts">
import { useTitle } from '@vueuse/core'
import { useI18n } from 'vue-i18n'
const { t } = useI18n()
useTitle(t('errors.not-found.text'))
</script>

<template>
  <div
    class="mt-20 flex flex-col flex-wrap items-center justify-center text-center text-xl sm:flex-row sm:space-x-2 sm:text-left"
  >
    <IconCloudQuestion class="h-12 w-12 fill-current" />
    <h1>{{ t('errors.not-found.text') }}</h1>
  </div>
</template>
