// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDetailsModel _$$_ProductDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProductDetailsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      thumbnailUrl: json['thumbnail_url'] as String?,
      discount: json['discount'] as int?,
      isFavorite: json['is_favorite'] as bool?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Variants.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductDetailsModelToJson(
        _$_ProductDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'thumbnail_url': instance.thumbnailUrl,
      'discount': instance.discount,
      'is_favorite': instance.isFavorite,
      'variants': instance.variants,
    };

_$_VariantSizes _$$_VariantSizesFromJson(Map<String, dynamic> json) =>
    _$_VariantSizes(
      id: json['id'] as int?,
      sizeText: json['size_text'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      qty: json['qty'] as int?,
      variantId: json['variant_id'] as int?,
    );

Map<String, dynamic> _$$_VariantSizesToJson(_$_VariantSizes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size_text': instance.sizeText,
      'price': instance.price,
      'qty': instance.qty,
      'variant_id': instance.variantId,
    };

_$_Variants _$$_VariantsFromJson(Map<String, dynamic> json) => _$_Variants(
      id: json['id'] as int?,
      name: json['name'] as String?,
      value: json['value'] as String?,
      productName: json['product_name'] as String?,
      imageUrl: json['image_url'] as String?,
      sizes: (json['sizes'] as List<dynamic>?)
          ?.map((e) => VariantSizes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VariantsToJson(_$_Variants instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'product_name': instance.productName,
      'image_url': instance.imageUrl,
      'sizes': instance.sizes,
    };
