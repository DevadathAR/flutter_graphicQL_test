const String getProductsQuery = r'''
{
  products(search: "Yoga pants", pageSize: 10) {
    total_count
    items {
        name
      sku
      image{
        url
      }
      
      categories {
        
        name
        uid
        
      }
      
      rating_summary
      
      review_count
      reviews {
        
        items {
          
          nickname
           summary
          average_rating
          ratings_breakdown{
            name
            value
          }
         
        }
      }
      related_products{
        image{
          url
        }
        short_description{html}
        name
        price_range{maximum_price{final_price{currency}}}
      }
      
    
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
