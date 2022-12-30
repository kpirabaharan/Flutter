import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _form = GlobalKey<FormState>();

  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageURLController = TextEditingController();

  var _isInit = true;
  var _initValues = {
    'id': '',
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  var _editedProduct =
      Product(id: '', title: '', description: '', price: 0, imageUrl: '');

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageURLController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final _prodToEdit =
          ModalRoute.of(context)!.settings.arguments as Product?;
      if (_prodToEdit != null) {
        _initValues = {
          'id': _prodToEdit.id,
          'title': _prodToEdit.title,
          'description': _prodToEdit.description,
          'price': _prodToEdit.price.toString(),
          'imageUrl': _prodToEdit.imageUrl,
        };
        _imageURLController.text = _prodToEdit.imageUrl;
        _editedProduct = Product(
          id: _prodToEdit.id,
          title: _prodToEdit.title,
          description: _prodToEdit.description,
          price: _prodToEdit.price,
          imageUrl: _prodToEdit.imageUrl,
          isFavorite: _prodToEdit.isFavorite,
        );
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    print(_editedProduct.id);
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    if (_editedProduct.id == '') {
      print("run1");
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    } else {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    }
    Navigator.of(context).pop();
  }

  String? errorCheckTitle(String value) {
    if (value.isEmpty) return 'Please provide a title.';

    return null;
  }

  String? errorCheckDescription(String value) {
    if (value.isEmpty) return 'Please provide a description.';

    if (value.length < 10)
      return 'Please provide a description greater than 10 characters.';

    return null;
  }

  String? errorCheckPrice(String value) {
    if (value.isEmpty) return 'Please enter a price.';

    if (double.tryParse(value) == null) return 'Please enter a valid number.';

    if (double.parse(value) <= 0)
      return 'Please enter a nuymber greater than zero.';

    return null;
  }

  String? errorCheckURL(String value) {
    if (value.isEmpty) return 'Please enter an image URL.';

    if ((!value.startsWith('http') && !value.startsWith('https')) ||
        (!value.endsWith('jpg') &&
            !value.endsWith('jpeg') &&
            !value.endsWith('png'))) return 'Please enter a valid image URL.';

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product'),
        actions: [
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_priceFocusNode),
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: value as String,
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
                validator: (value) {
                  return errorCheckTitle(value as String);
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descriptionFocusNode),
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(value as String),
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
                validator: (value) {
                  return errorCheckPrice(value as String);
                },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: value as String,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
                validator: (value) {
                  return errorCheckDescription(value as String);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Container(
                      child: _imageURLController.text.isEmpty
                          ? Text(
                              'Enter a URL',
                              textAlign: TextAlign.center,
                            )
                          : FittedBox(
                              child: Image.network(
                                _imageURLController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageURLController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        return errorCheckURL(value as String);
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: value as String,
                          isFavorite: _editedProduct.isFavorite,
                        );
                      },
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
