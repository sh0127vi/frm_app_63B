Product.create!(
  name: 'サバ',
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
  product_id: '1',
  images: 'https://askul.c.yimg.jp/img/product/3L1/4004438_3L1.jpg'
)