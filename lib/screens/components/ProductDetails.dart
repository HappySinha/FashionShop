import 'package:fashion_shop/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int cartNum = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: buildAppBar(context),
      body: productBody(size),
    );
  }

  SingleChildScrollView productBody(Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      colorAndSize(),
                      SizedBox(height: kDefaultPadding / 2),
                      description(),
                      SizedBox(height: 40),
                      counterFavBtn(),
                      SizedBox(height: kDefaultPadding / 2),
                      cartBuy()
                    ],
                  ),
                ),
                productTitleWithImage()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding cartBuy() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: [cart(), buy()],
      ),
    );
  }

  Expanded buy() {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: FlatButton(
          color: widget.product.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () {},
          child: Text(
            "Buy Now".toUpperCase(),
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Container cart() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: widget.product.color),
          borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.only(right: kDefaultPadding),
      child: SizedBox(
        width: 64,
        height: 50,
        child: OutlineButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            if (cartNum < 10) {
              setState(() {
                cartNum++;
              });
            }
          },
          color: widget.product.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_shopping_cart,
                color: widget.product.color,
              ),
              Text(
                cartNum.toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: widget.product.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );

//      InkWell(
//      onTap: () {
//        setState(() {
//          cartNum++;
//        });
//      },
//      child: Container(
//        margin: EdgeInsets.only(right: kDefaultPaddin),
//        height: 50,
//        width: 58,
//        decoration: BoxDecoration(
//          color: Colors.red,
//          border: Border.all(
//            color: widget.product.color,
//          ),
//          borderRadius: BorderRadius.circular(16),
//        ),
//        child: IconButton(
//            icon: SvgPicture.asset(
//              "assets/icons/add_to_cart.svg",
//              color: widget.product.color,
//            ),
//            onPressed: () {}),
//      ),
//    );
  }

  Row counterFavBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(),
        favBtn(),
      ],
    );
  }

  Container favBtn() {
    return Container(
      width: 34,
      height: 34,
      padding: EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: Color(0xffff6464), shape: BoxShape.circle),
      child: SvgPicture.asset("assets/icons/heart.svg"),
    );
  }

  Padding colorAndSize() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Color",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        ColorDot(
                          color: Color(0xFF356c95),
                          isSelected: true,
                        ),
                        ColorDot(color: Color(0xFFF8c078)),
                        ColorDot(color: Color(0xFFA29B9B)),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: kTextColor),
                    children: [
                      TextSpan(text: "Size\n"),
                      TextSpan(
                        text: "${widget.product.size}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding description() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        widget.product.description,
        style: TextStyle(height: 1.5, fontSize: 16),
      ),
    );
  }

  Padding productTitleWithImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            widget.product.title,
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${widget.product.price}",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: Hero(
                  tag: "${widget.product.id}",
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: widget.product.color,
      elevation: 0.0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      margin:
          EdgeInsets.only(top: kDefaultPadding / 4, right: kDefaultPadding / 2),
      padding: EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItem = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItem > 1) {
              setState(
                () {
                  numOfItem--;
                },
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(numOfItem.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.headline6),
        ),
        buildOutlineButton(
          icon: Icons.add,
          press: () {
            if (numOfItem < 10) {
              setState(
                () {
                  numOfItem++;
                },
              );
            }
          },
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        onPressed: press,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon),
      ),
    );
  }
}
