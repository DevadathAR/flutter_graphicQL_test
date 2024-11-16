const String getProductsQuery = r'''
{
  products(search: "Yoga pants", pageSize: 10) {
    total_count
    items {
      image{
        url
      }
      categories {
        __typename
      }
      rating_summary
      review_count
      related_products{
        image{
          url
        }
        short_description{html}
        name
        price_range{maximum_price{final_price{currency}}}
      }
      reviews {
        items {
          
          average_rating
        }
      }
      name
      sku
      description {
        html
      }
      price_range {
        minimum_price {
          regular_price {
            value
            currency
          }
        }
      }
    }
    page_info {
      page_size
      current_page
    }
  }
}

''';


const totalCount = r'''
{
  products(search: "Yoga pants", pageSize: 1) {
    total_count
  }
}
''';
