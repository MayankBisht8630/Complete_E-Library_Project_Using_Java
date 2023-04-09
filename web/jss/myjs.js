function add_to_cart(pid,pname,ammount)
{
    let cart = localStorage.getItem("cart");
    if(cart == null)
    {
        //no book is issue
        let products = [];
        let product = {productId : pid , productName : pname , productQuantity : 1 ,productammount : ammount};
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("Added To Issued Corner");
        event.preventDefault();
        swal("Good job!", "Added To Issued Corner!!", "success");
    }
    else
    {
        //alredy books is issued
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid)
        if(oldProduct)
        {
            //we have to increase the quantity 
            oldProduct.productQuantity = oldProduct.productQuantity+1;
            pcart.map((item)=> {
                if(item.productId == oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart",JSON.stringify(pcart));
             console.log("Issue Book Quantity Is Increased");
             event.preventDefault();
             swal("Good job!", "Issue Book Quantity Is Increased !!", "success");
        }
        else
        {
            //we have to add the quantity 
            let product = {productId : pid , productName : pname , productQuantity : 1 ,productammount : ammount};
            pcart.push(product);
            localStorage.setItem("cart",JSON.stringify(pcart));
             console.log("Added To Book Issue");
             event.preventDefault();
             swal("Good job!", "Added To Issue Corner", "success");
        }
    }
    updateCart();
}

//updatecart
function updateCart()
{
    let cartString=localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart == null || cart.length == 0)
    {
        console.log("cart s empty");
        $(".cart-item").html("( 0 )");
        $(".cart-body").html("<h3>Card Dosenot Have Any Item</h3>");
        $(".issue-btn").attr('disabled' , true)
    }
    else
    {
        //something to show in cart
        console.log(cart);
        $(".cart-items").html(`{${cart.length}}`);
        let table=`
            <table class ='table'>
            <thead class='thread-light'>
              <tr>
                 <th>Book Name</th>
                 <th>Available Books</th>
                 <th>Book Issue </th>
                 <th>Action </th>
                 
              </tr>
            </thead>
                 `;
            let totalPrice = 0;
            cart.map((item)=> {
                table+=`
                       <tr>
                           <td> ${item.productName}</td>
                           <td> ${item.productammount - item.productQuantity}</td>
                           <td> ${item.productQuantity}</td>
                           <td> <button onclick = 'deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                       </tr>
             `
             totalPrice += item.productQuantity;
            })
            
            table = table+`
            <tr><td colspan = '5' class ='text-right font-weight-bold m-5'> Total Books : ${totalPrice} </td></tr></table>`
            $(".cart-body").html(table);
            $(".issue-btn").attr('disabled' , false)
    }
    
}

function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item)=> item.productId != pid);
    localStorage.setItem('cart',JSON.stringify(newcart))
    updateCart();
}

$(document).ready(function(){
    updateCart();
})

function goToCheckout()
{
    window.location = "issue_page.jsp";
}
