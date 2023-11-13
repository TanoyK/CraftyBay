# CraftyBay

# Description 
CraftyBay is a high feature e-commerce flutter application. Here customers get enjoyable online shopping experience.
Products order and payment system totally focused on user friendly.


# Application Download Link
> https://drive.google.com/file/d/1tXd0fn9KlZ8YJ1H4ZQMcHIVBhoV7w1gN/view?usp=sharing

# Application Video Link
> https://drive.google.com/file/d/1AShQqria6krJrnv8vLB1WHo0SzJjb_qU/view?usp=drivesdk


# Importent Feature
> Login verification
> Profile complete & read profile data
> Ecommerce product list by category
> Review list implement
> Product checkout process
> Payment gateway
> Internet connectivity checking


# Application UI
![Wishlist](https://github.com/TanoyK/CraftyBay/assets/134632334/36eb4a42-ae37-4b52-a8ce-edf2f9a6f6a6)
![Update profile-2](https://github.com/TanoyK/CraftyBay/assets/134632334/cf87d3e0-1ffa-41da-9667-4733981f2a52)
![Update profile-1](https://github.com/TanoyK/CraftyBay/assets/134632334/87ba04ee-12d0-42af-b8ff-883ff3cf3cff)
![Shipping address](https://github.com/TanoyK/CraftyBay/assets/134632334/e1849dbe-9745-4362-8409-3fc08a44c66d)
![Review screen](https://github.com/TanoyK/CraftyBay/assets/134632334/e478b97c-2ae7-46a8-a32c-de29072db42f)
![Product details](https://github.com/TanoyK/CraftyBay/assets/134632334/1d9d0c7d-18b9-42ca-a870-75c07e788a3e)
![Payment-2](https://github.com/TanoyK/CraftyBay/assets/134632334/ca4f6a71-4e34-41fe-93f4-365574dd671e)
![Payment-1](https://github.com/TanoyK/CraftyBay/assets/134632334/f44e5b65-4ac4-48b1-81f7-5f33e56d63e3)
![Home Screen](https://github.com/TanoyK/CraftyBay/assets/134632334/673fbe8d-c20d-48b8-8728-4263f1d0ec83)
![Home screen light theme](https://github.com/TanoyK/CraftyBay/assets/134632334/4507467b-c8cf-4fe7-ab60-cff8b6901b37)
![Email verification](https://github.com/TanoyK/CraftyBay/assets/134632334/d903779e-0bcd-4922-bb3a-385cc37150e0)
![Create review](https://github.com/TanoyK/CraftyBay/assets/134632334/7686832d-a702-40c2-9dc9-cb644d773c18)
![CheckOut](https://github.com/TanoyK/CraftyBay/assets/134632334/fa447ef1-9fe8-49fd-97f0-d6da821ded8f)
![categories screen](https://github.com/TanoyK/CraftyBay/assets/134632334/737b0e12-8c8a-4ac0-a825-d50fb6cf89f8)
![Categories light theme](https://github.com/TanoyK/CraftyBay/assets/134632334/5a2f9c2f-9102-4d88-a91e-0810d1ad3eb3)
![Cart screen](https://github.com/TanoyK/CraftyBay/assets/134632334/98a32d74-c877-4444-b202-304bb00e0e42)
![Cart screen light theme](https://github.com/TanoyK/CraftyBay/assets/134632334/5ede719c-8642-4db4-a5c6-8aeea7c930b5)



## Project structure
craftybay_ecommerce_application/
├── assets/
│   └── images/
│       ├── logo.svg
│       ├── logo_nav.png
│       └── shoe.png
└── lib/
    ├── application/   
    │   ├── app.dart
    │   └── state_holder_binder.dart
    ├── data/
    │   ├── models/
    │   │   ├──  brand.dart	
    │   │   ├──  cart_list_model.dart
    │   │   ├──  category_data.dart
    │   │   ├──  category_model.dart
    │   │   ├──  invoice_create_response_model.dart
    │   │   ├──  network_response.dart
    │   │   ├──  payment_method.dart
    │   │   ├──  product.dart
    │   │   ├──  product_details.dart
    │   │   ├──  product_details_model.dart
    │   │   ├──  product_model.dart
    │   │   ├──  product_reviewlist_model.dart
    │   │   ├──  read_profile_model.dart
    │   │   ├──  slider_model.dart
    │   │   └──  wishlist_product_model.dart
    │   ├── services/
    │   │   └── network_caller.dart
    │   └── utility/
    │       └── urls.dart
    ├── presentation/
    │   ├── state_holders/
    │   │   ├──  add_to_cart_controller.dart
    │   │   ├──  auth_controller.dart
    │   │   ├──  cart_list_controller
    │   │   ├──  category_controller.dart
    │   │	 ├──  create_invoice_controller.dart
    │   │   ├──  create_profile_controller.dart
    │   │   ├──  create_review_controller.dart
    │   │   ├──  create_wishlist_controller.dart
    │   │   ├──  email_verification_controller.dart
    │   │   ├──  home_slider_controller.dart
    │   │   ├──  main_bottom_nav_controller.dart
    │   │   ├──  new_product_controller.dart
    │   │	 ├──  otp_verification_controller.dart
    │   │   ├──  popular_product_controller.dart
    │   │   ├──  product_details_controller.dart
    │   │   ├──  product_list_controller.dart
    │   │   ├──  product_review_controller.dart
    │   │	 ├──  read_profile_controller.dart
    │   │   ├──  special_product_controller.dart
    │   │   ├──  theme_mode_controller.dart
    │   |   ├──   wishlist_controller.dart
    │   │   ├──  wishlist_product_delete_controller.dart
    │   └── ui/
    │       ├── screens/
    │       │   │		auth/
    │       │   │ 		├──  complete_profile_screen.dart
    │       │   │		├──  email_verification_screen.dart
    │       │   │		├──  otp_verification_screen.dart
    │       │   │ 		├──  update_profile_screen.dart
    │       │   ├──  cart_screen.dart
    │       │   ├──  category_list_screen.dart
		 ├──  checkout_screen.dart	
    │       │   ├──  create_review_screen.dart
    │       │   ├──  home_screen.dart
    │       │   ├──  main_bottom_nav_screen.dart
    │       │   ├──  product_details_screen.dart
    │       │   ├──  product_list_screen.dart	
    │       │   ├──  product_reviews_screen.dart
    │       │   ├──  splash_screen.dart
    │       │	 ├──  webview_screen.dart
    │       │   └──  wishlist_screen.dart
    │       ├── utility/
    │       │   └──   app_colors.dart
    │       │	 ├── 	color_extension.dart
    │       │	 ├── 	image_assets.dart
    │       └── widgets/
    │           ├── home/
    │                ├──  cart_product_card.dart
    │		         ├──  category_card.dart
    │		         ├──  circulariconButton.dart
    │                ├──  custom_stepper.dart
    │           	 ├──  product_card.dart
    │          		 ├──  review_card.dart
    │           	 ├──  review_title.dart
    │		         ├──  size_picker.dart
    │                └──  wishlist_product_card.dart
    └── main.dart


# Package & Dependency
> cupertino_icons: ^1.0.2
>  flutter_svg: ^2.0.7
> get: ^4.6.5
> pin_code_fields: ^8.0.1
> carousel_slider: ^4.2.1
> http: ^1.1.0
> shared_preferences: ^2.2.1
> connectivity_plus: ^5.0.1
> webview_flutter: ^4.4.2
> url_launcher: ^6.1.9
> flutter_rating_bar: ^4.0.1



    
