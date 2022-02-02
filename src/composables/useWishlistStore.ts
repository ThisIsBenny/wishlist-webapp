import useAxios from '@/composables/useAxios'
import { Wishlist, WishlistItem } from '@/types'
import { ref } from 'vue'
const { client } = useAxios()

const refState = ref<Wishlist | any>({})

const fetch = async (slugText: string): Promise<void> => {
  const { data } = await client.get(`/wishlist/${slugText}`)
  refState.value = data
}

const updateItem = async (item: WishlistItem): Promise<void> => {
  await client.put(`/wishlist/${item.wishlistId}/item/${item.id}`, item)
}

export const useWishlistStore = () => {
  return {
    list: refState,
    fetch,
    updateItem,
  }
}
