

Product.create!(
  name: '本',
  detail: '自己啓発',
  price: '2000',
  condition: '中古',
  city: '滋賀',
  delivery: '100',
  fee_payer: '100',
  delivery_area: '草津',
  user_id: '6',
  category_id: '1'
)

Image.create!(
  product_id: '2',
  images: 'https://illust8.com/wp-content/uploads/2019/04/thick-book_illust_3551.png'
)