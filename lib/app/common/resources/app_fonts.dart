import 'package:flutter/widgets.dart';
import 'package:nasa_app/app/common/resources/app_colors.dart';

extension TextExtension on Text {
  Text titleBold({TextStyle? style, double? size, Color? color}) {
    final TextStyle defaultStyle = TextStyle(
      color: color ?? AppColors.primary,
      fontWeight: FontWeight.w700,
      fontSize: size ?? 24,
    );
    return Text(
      data ?? '',
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      style: style != null
          ? TextStyle(
              color: style.color ?? defaultStyle.color,
              fontWeight: style.fontWeight ?? defaultStyle.fontWeight,
              fontSize: style.fontSize ?? defaultStyle.fontSize,
            )
          : defaultStyle,
    );
  }

  Text emphasyText({TextStyle? style, double? size, Color? color}) {
    final TextStyle defaultStyle = TextStyle(
      color: color ?? AppColors.neutral500,
      fontWeight: FontWeight.w700,
      fontSize: size ?? 14,
    );
    return Text(
      data ?? '',
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      style: style != null
          ? TextStyle(
              color: style.color ?? defaultStyle.color,
              fontWeight: style.fontWeight ?? defaultStyle.fontWeight,
              fontSize: style.fontSize ?? defaultStyle.fontSize,
            )
          : defaultStyle,
    );
  }

  Text bodyText({TextStyle? style, double? size, Color? color}) {
    final TextStyle defaultStyle = TextStyle(
      color: color ?? AppColors.neutral300,
      fontWeight: FontWeight.w400,
      fontSize: size ?? 14,
    );
    return Text(
      data ?? '',
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      style: style != null
          ? TextStyle(
              color: style.color ?? defaultStyle.color,
              fontWeight: style.fontWeight ?? defaultStyle.fontWeight,
              fontSize: style.fontSize ?? defaultStyle.fontSize,
            )
          : defaultStyle,
    );
  }

  Text bodyLight({TextStyle? style, double? size, Color? color}) {
    final TextStyle defaultStyle = TextStyle(
      color: color ?? AppColors.neutral500,
      fontWeight: FontWeight.w200,
      fontSize: size ?? 14,
    );
    return Text(
      data ?? '',
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      style: style != null
          ? TextStyle(
              color: style.color ?? defaultStyle.color,
              fontWeight: style.fontWeight ?? defaultStyle.fontWeight,
              fontSize: style.fontSize ?? defaultStyle.fontSize,
              fontFamily: style.fontFamily ?? defaultStyle.fontFamily,
            )
          : defaultStyle,
    );
  }
}
