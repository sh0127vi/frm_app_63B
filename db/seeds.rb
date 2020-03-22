2.times do |n|
  Product.create!(
    user_id:     "1"
    category_id: "1"
    name:        "test#{n + 1}",
    price:       "#{(n + 1)*1000}"

  )

2.times do |n|
  Product.create!(
    user_id:     "1"
    category_id: "1"
    name:        "test売り切れ#{n + 1}",
    price:       "#{(n + 1)*1000}"
  )

Image.create!(
  [
    {
      images:     "https://s3-ap-northeast-1.amazonaws.com/mercarimaster/uploads/captured_image/content/13/a007.png"
      product_id: "1"
    },
    {
      images:     "https://s3-ap-northeast-1.amazonaws.com/mercarimaster/uploads/captured_image/content/10/a004.png"
      product_id: "3"
    }
  ]
)

Purchase.create!(
  [
    {
      buyer_id:   2
      product_id: 3
    },
    {
      buyer_id:   2
      product_id: 4
    }
  ]
)