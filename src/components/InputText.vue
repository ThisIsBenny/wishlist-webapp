<template>
  <div class="relative mb-8">
    <label class="mb-1 block w-full" :for="name"
      >{{ label }}<span v-if="required" class="text-red-500">*</span></label
    >
    <input
      class="h-12 w-full rounded-md border-2 border-solid border-stone-300 bg-transparent px-2 outline-none dark:border-stone-700"
      :class="{ 'border-rose-500': !!errorMessage }"
      :name="name"
      :id="name"
      :type="type"
      :value="inputValue"
      :placeholder="placeholder"
      @input="handleChange"
      @blur="handleBlur"
      v-bind="$attrs"
    />

    <p class="absolute mt-2 text-sm text-rose-500" v-show="errorMessage">
      {{ errorMessage }}
    </p>
  </div>
</template>

<script setup lang="ts">
import { useField } from 'vee-validate'

const props = defineProps({
  type: {
    type: String,
    default: 'text',
  },
  value: {
    type: String,
    default: '',
  },
  name: {
    type: String,
    required: true,
  },
  label: {
    type: String,
    required: true,
  },
  placeholder: {
    type: String,
    default: '',
  },
  required: {
    type: Boolean,
    default: false,
  },
})
const {
  value: inputValue,
  errorMessage,
  handleBlur,
  handleChange,
} = useField(props.name, undefined, {
  initialValue: props.value,
})
</script>
