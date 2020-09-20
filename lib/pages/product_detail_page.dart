import 'package:demo_woocommerce/models/product_model.dart';
import 'package:demo_woocommerce/utils/html_tag_remover.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  static final routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as ProductModel;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _crearBarra(product),
            _crearContenido(product),
          ],
        ),
      ),
    );
  }

  Widget _crearBarra(ProductModel pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.purple,
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
          image: NetworkImage(pelicula.images[0].src),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _crearContenido(ProductModel product) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          SizedBox(height: 20.0),
          _crearPrecio(product.price),
          SizedBox(height: 20.0),
          _crearNombre(product.name),
          SizedBox(height: 20.0),
          _crearDescripcion(product.description),
          SizedBox(height: 20.0),
          _crearBoton(),
        ]),
      ),
    );
  }

  Text _crearPrecio(String precio) {
    return Text(
      'S/ $precio',
      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    );
  }

  Text _crearNombre(String descripcion) {
    return Text(
      '$descripcion',
      style: TextStyle(fontSize: 12.0, color: Colors.black),
    );
  }

  Widget _crearDescripcion(String descripcionLarga) {
    return Text(
      HtmlTagRemover.removeElement(descripcionLarga, 'p'),
      style: TextStyle(fontSize: 10.0, color: Colors.grey),
      textAlign: TextAlign.justify,
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
      child: Text(
        'Ordenar ahora!',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.purple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      onPressed: () {},
    );
  }
}
