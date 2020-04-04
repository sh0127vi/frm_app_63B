Category.create(
  name: 'メンズ'
)

Product.create!(
  name: 'サバ',
  detail: '新鮮',
  price: '2500',
  condition: '刺身',
  city: '滋賀',
  delivery: '100',
  fee_payer: '100',
  delivery_area: '草津',
  user_id: '1',
  category_id: '1'
)

Image.create!(
  product_id: '1',
  images: 'https://askul.c.yimg.jp/img/product/3L1/4004438_3L1.jpg'
)
