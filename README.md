# VectorPDFExample
Scaled Vector Images

Example of using the new *Preserve Vector Data* asset catalog feature, introduced with Xcode 9, to create smooth scaling images. This also makes it easy to support two new accessibility features in iOS 11:

+ Adjusing Image Sizes For Accessibility
+ Large Content Size Images For Bar Items

## Preserve Vector Data

Xcode 9 added the support to treat the image as a vector at runtime. This means that images can be smoothly scaled to arbitrary sizes. The only change you need to make is to tick Preserve Vector Data for the PDF image in the asset catalog:

<img src="https://raw.githubusercontent.com/satyadevchauhan/VectorPDFExample/master/Image%20Assets%20-%20Vector%20PDF%20Attributes.png">

## Accessibility

### Adjusting Image Sizes For Accessibility

In iOS 11, Apple added the [UIAccessibilityContentSizeCategoryImageAdjusting](https://developer.apple.com/documentation/uikit/uiaccessibilitycontentsizecategoryimageadjusting) protocol. Both [UIButton](https://developer.apple.com/documentation/uikit/uibutton) and [UIImageView](https://developer.apple.com/documentation/uikit/uiimageview) adopts the protocol which adds a single boolean property [adjustsImageSizeForAccessibilityContentSizeCategory](https://developer.apple.com/documentation/uikit/uiaccessibilitycontentsizecategoryimageadjusting/2890929-adjustsimagesizeforaccessibility?language=objc). If you set this to true the image size increases when you use any of the larger accessibility text sizes (the normal content text sizes have no effect).

To add support:

    1. Add a PDF image to the asset catalog and be sure to tick Preserve Vector Data as before:

    2. When adding the image view or button to the Storyboard make sure to tick Adjusts Image Size in Attributes Inspector:
       
       <img src="https://github.com/satyadevchauhan/VectorPDFExample/master/Accessibility-Adjust%20Image%20Size.png">
        
       Accessibilty: [x] Adjust Image Size

    3. If adding the image view in code:

      imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true

## Colours
Why are the icons only available in black? Xcode 6 also allows you to set the tint colour applied to the vector image. To enable this, ensure `Render As: Template Image` is set in the asset attribute inspector.

You can apply a tint colour using interface builder or manually in code:

    // Obj-C
    [imageView setTintColor:[UIColor whiteColor]];
    // Swift
    imageView.tintColor = UIColor.whiteColor()
