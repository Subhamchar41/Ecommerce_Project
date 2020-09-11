fuction add_to_cart(pid, pname, pprice){
    let cart = localStrogae.getItem("cart");
    if (cart==null){
        let products=[];
        let product={productId: pid, productName: pname, productQuantity: 1, productPrice: pprice}
        products.pudh(product);
        localStroge.setItem("cart", JSON.stringify(products));
    }else
    {
     let pcart = JSON.parse(cart);
     let oldProduct= pcart.find((item) => item.productId = pid)
     if (oldProduct){
         oldProduct.productQuantity = oldProduct.productQuantity +1
         pcart.map((item) => {
             if (item.productId == oldProduct.productId){
                 item..productQuantity =  oldProduct.productQuantity;
             }
         })
         localStroge.setItem("cart", JSON.stringify(pcart));
        console.log("Product is increased");
     }else{
          let product={productId: pid, productName: pname, productQuantity: 1, productPrice: pprice}
        products.pudh(product);
        localStroge.setItem("cart", JSON.stringify(pcart));
        console.log("Product is increased");
     }
    }
    
    updateCart();
}

function updateCart(){
    let cartString= localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart == null || cart.length == 0){
        console.log("cart is empty")
        $(".cart-items").html("(0)");
        $(".cart-body").html("Cart does not have any item");
        $(".checkout-btn").addclass("dishabled");
    }else{
        console.log(cart);
         $(".cart-items").html((${cart.length}));
         let table=
                 <table class='table'>
         <thead class='thread-light'>
         <tr>
         <th>Item Name</th>
         <th>Price</th>
         <th>Quantity</th>
         <th>Total Price</th>
        </tr>
        </thead>
        ;
        cart.map(item) => {
        
        table+=
                <tr>
        <td>${item.productName}</td>
        <td>${item.productPrice}</td>
        <td>${item.productQuantity}</td>
        <td>${item.productQuantity* item.productPrice}</td>
        <td><button class='btn btn-primary btn-sm'>Remove</button> </td>
        </tr>
        
        totalPrice+= item.productPrice * item.productQuantity;
       
        table= table+
                <tr><td colspan='5'>Tital Price: ${totalPrice}</td></tr>
                `</table>`
         $(".cart-body").html(table);
    }
}


function deleteItemFromCart(pid){

 let cart=JSON.parse(localStorage.getItem("cart"));
 let newcart=cart.filter((item) => item.productId != pid);
 localStroge.setItem('cart', JSON.stringify(newcart));
 update();
}


$(document).ready(function(){
    updateCart();
})

