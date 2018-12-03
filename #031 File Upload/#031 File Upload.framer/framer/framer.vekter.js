(function(scope) {var __layer_0__ = new Layer({"name":"#031 File Upload","backgroundColor":"rgba(255,255,255,1)","width":800,"height":600,"constraintValues":null,"blending":"normal","clip":true,"borderStyle":"solid","y":-4});var dropArea = new Layer({"parent":__layer_0__,"name":"dropArea","shadows":[{"spread":0,"x":0,"type":"box","y":2,"blur":30,"color":"hsla(0, 0%, 0%, 0.12)"},{"spread":0,"x":0,"type":"box","y":20,"blur":45,"color":"hsla(190, 72%, 54%, 0.12)"}],"backgroundColor":"#fff","width":400,"x":200,"height":300,"constraintValues":{"left":null,"height":300,"centerAnchorX":0.5,"width":400,"top":null,"centerAnchorY":0.5},"blending":"normal","borderRadius":10,"clip":false,"borderStyle":"dashed","y":150});var ripple = new Layer({"parent":dropArea,"name":"ripple","backgroundColor":"rgba(54, 193, 222, 0.56)","width":400,"height":300,"constraintValues":{"height":300,"centerAnchorX":0.5,"width":400,"bottom":0,"right":0,"centerAnchorY":0.5},"blending":"normal","borderRadius":10,"clip":false,"borderStyle":"solid"});var contents = new Layer({"parent":dropArea,"name":"contents","backgroundColor":null,"width":232,"x":84,"height":83,"constraintValues":{"left":null,"height":83,"centerAnchorX":0.5,"width":232,"bottom":30,"top":null,"centerAnchorY":0.76166666666666671},"blending":"normal","clip":false,"borderStyle":"solid","y":187});var button = new Layer({"parent":contents,"name":"button","shadows":[{"spread":0,"x":0,"type":"box","y":10,"blur":20,"color":"hsla(190, 72%, 54%, 0.24)"}],"backgroundColor":"rgba(54, 193, 222, 1.00)","width":200,"x":16,"height":44,"constraintValues":{"left":16,"height":44,"centerAnchorX":0.5,"width":200,"bottom":0,"right":16,"top":null,"centerAnchorY":0.73493975903614461},"blending":"normal","borderRadius":4,"clip":false,"borderStyle":"solid","y":39});var buttonText = new TextLayer({"parent":button,"name":"buttonText","backgroundColor":null,"width":97,"x":51,"styledText":{"blocks":[{"inlineStyles":[{"startIndex":0,"endIndex":12,"css":{"fontSize":"16px","WebkitTextFillColor":"#fff","whiteSpace":"pre","fontWeight":600,"letterSpacing":"0px","tabSize":4,"fontFamily":"\"SFUIText-Semibold\", \"SF UI Text\", sans-serif","lineHeight":"1.2"}}],"text":"Browse files"}]},"height":19,"constraintValues":{"left":null,"height":19,"centerAnchorX":0.4975,"width":97,"top":null,"centerAnchorY":0.51136363636363635},"blending":"normal","autoSize":true,"y":13});var __layer_1__ = new TextLayer({"parent":contents,"backgroundColor":null,"width":232,"styledText":{"blocks":[{"inlineStyles":[{"css":{"fontSize":"16px","WebkitTextFillColor":"hsla(0, 0%, 0%, 0.56)","whiteSpace":"pre","fontWeight":600,"letterSpacing":"0px","tabSize":4,"fontFamily":"\"SFUIText-Semibold\", \"SF UI Text\", sans-serif","lineHeight":"1.2"},"startIndex":0,"endIndex":29}],"text":"Drag and Drop your files here"}]},"height":19,"constraintValues":{"left":null,"height":19,"centerAnchorX":0.5,"width":232,"centerAnchorY":0.1144578313253012},"blending":"normal","autoSize":true});var uploadIcon = new SVGLayer({"parent":contents,"name":"uploadIcon","shadows":[{"x":0,"type":"drop","y":5,"blur":10,"color":"hsla(190, 72%, 54%, 0.24)"}],"backgroundColor":null,"width":100,"x":66,"htmlIntrinsicSize":{"height":512,"width":512},"color":"rgba(54, 193, 222, 1.00)","height":100,"constraintValues":{"left":null,"aspectRatioLocked":true,"height":100,"centerAnchorX":0.5,"width":100,"top":-120,"centerAnchorY":-0.84337349397590367},"blending":"normal","y":-120,"svg":"<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>\n<!DOCTYPE svg PUBLIC \"-\/\/W3C\/\/DTD SVG 1.1\/\/EN\" \"http:\/\/www.w3.org\/Graphics\/SVG\/1.1\/DTD\/svg11.dtd\">\n<!-- Generator: Adobe Illustrator 16.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  --><svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" xmlns:xlink=\"http:\/\/www.w3.org\/1999\/xlink\" version=\"1.1\" id=\"Layer_1\" x=\"0px\" y=\"0px\" width=\"512px\" height=\"512px\" viewBox=\"0 0 512 512\" enable-background=\"new 0 0 512 512\" xml:space=\"preserve\"><g><path d=\"M446.844,208.875C447.625,203.313,448,197.656,448,192c0-70.563-57.406-128-128-128   c-40.938,0-78.531,19.344-102.344,51.063C209.25,113.031,200.688,112,192,112c-61.75,0-112,50.25-112,112   c0,1.563,0.031,3.094,0.094,4.625C33.813,242.375,0,285.313,0,336c0,61.75,50.25,112,112,112h272c70.594,0,128-57.406,128-128   C512,273.344,486.344,231.188,446.844,208.875z M384,416H112c-44.188,0-80-35.813-80-80s35.813-80,80-80   c2.438,0,4.75,0.5,7.125,0.719c-4.5-10-7.125-21.031-7.125-32.719c0-44.188,35.813-80,80-80c14.438,0,27.813,4.125,39.5,10.813   C246,120.25,280.156,96,320,96c53.031,0,96,42.969,96,96c0,12.625-2.594,24.625-7.031,35.688C449.813,238.75,480,275.688,480,320   C480,373.031,437.031,416,384,416z\"><\/path><polygon points=\"160,288 224,288 224,384 288,384 288,288 352,288 256,192  \"><\/polygon><\/g><\/svg>"});var fileSize = new Layer({"parent":dropArea,"name":"fileSize","backgroundColor":null,"width":109,"x":20,"height":38,"constraintValues":{"left":20,"height":38,"centerAnchorX":0.18625,"width":109,"bottom":13,"top":null,"centerAnchorY":0.89333333333333331},"blending":"normal","clip":false,"borderStyle":"solid","y":249});var __layer_2__ = new TextLayer({"parent":fileSize,"backgroundColor":null,"width":109,"styledText":{"blocks":[{"inlineStyles":[{"css":{"fontSize":"16px","WebkitTextFillColor":"#fff","whiteSpace":"pre","fontWeight":400,"letterSpacing":"0px","tabSize":4,"fontFamily":"\"ArialRoundedMTBold\", \"Arial Rounded MT Bold\", sans-serif","lineHeight":"1.2"},"startIndex":0,"endIndex":11}],"text":"musicMV.mp4"}]},"height":19,"constraintValues":{"left":null,"height":19,"centerAnchorX":0.5,"width":109,"centerAnchorY":0.25},"blending":"normal","autoSize":true});var __layer_3__ = new TextLayer({"parent":fileSize,"backgroundColor":null,"width":104,"styledText":{"blocks":[{"inlineStyles":[{"css":{"fontSize":"12px","WebkitTextFillColor":"hsla(0, 0%, 100%, 0.87)","whiteSpace":"pre","fontWeight":400,"letterSpacing":"0px","tabSize":4,"fontFamily":"\"ArialRoundedMTBold\", \"Arial Rounded MT Bold\", sans-serif","lineHeight":"1.2"},"startIndex":0,"endIndex":16}],"text":"MPEG-4   16.5 MB"}]},"height":14,"constraintValues":{"left":null,"height":14,"centerAnchorX":0.47706422018348627,"width":104,"bottom":0,"top":null,"centerAnchorY":0.81578947368421051},"blending":"normal","autoSize":true,"y":24});var file = new SVGLayer({"parent":__layer_0__,"name":"file","backgroundColor":null,"width":36,"x":386,"htmlIntrinsicSize":{"height":24,"width":24},"color":"rgba(54, 193, 222, 1.00)","height":36,"constraintValues":{"left":null,"aspectRatioLocked":true,"height":36,"centerAnchorX":0.505,"width":36,"bottom":77,"right":378,"top":null,"centerAnchorY":0.84166666666666667},"blending":"normal","y":487,"svg":"<?xml version=\"1.0\"?><svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-file-text\"><path d=\"M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z\"><\/path><polyline points=\"14 2 14 8 20 8\"><\/polyline><line x1=\"16\" y1=\"13\" x2=\"8\" y2=\"13\"><\/line><line x1=\"16\" y1=\"17\" x2=\"8\" y2=\"17\"><\/line><polyline points=\"10 9 9 9 8 9\"><\/polyline><\/svg>"});if(__layer_3__ !== undefined){__layer_3__.__framerInstanceInfo = {"framerClass":"TextLayer","hash":"#vekter|__layer_3__","vekterClass":"TextNode","text":"MPEG-4   16.5 MB"}};if(ripple !== undefined){ripple.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|ripple","targetName":"ripple","vekterClass":"FrameNode"}};if(buttonText !== undefined){buttonText.__framerInstanceInfo = {"framerClass":"TextLayer","hash":"#vekter|buttonText","targetName":"buttonText","vekterClass":"TextNode","text":"Browse files"}};if(button !== undefined){button.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|button","targetName":"button","vekterClass":"FrameNode"}};if(uploadIcon !== undefined){uploadIcon.__framerInstanceInfo = {"originalFilename":"#031 File Upload.svg","framerClass":"SVGLayer","hash":"#vekter|uploadIcon","targetName":"uploadIcon","vekterClass":"SVGNode"}};if(__layer_1__ !== undefined){__layer_1__.__framerInstanceInfo = {"framerClass":"TextLayer","hash":"#vekter|__layer_1__","vekterClass":"TextNode","text":"Drag and Drop your files here"}};if(__layer_2__ !== undefined){__layer_2__.__framerInstanceInfo = {"framerClass":"TextLayer","hash":"#vekter|__layer_2__","vekterClass":"TextNode","text":"musicMV.mp4"}};if(file !== undefined){file.__framerInstanceInfo = {"originalFilename":"file-text","framerClass":"SVGLayer","hash":"#vekter|file","targetName":"file","vekterClass":"SVGNode"}};if(__layer_0__ !== undefined){__layer_0__.__framerInstanceInfo = {"hash":"#vekter|__layer_0__","vekterClass":"FrameNode","framerClass":"Layer"}};if(dropArea !== undefined){dropArea.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|dropArea","targetName":"dropArea","vekterClass":"FrameNode"}};if(contents !== undefined){contents.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|contents","targetName":"contents","vekterClass":"FrameNode"}};if(fileSize !== undefined){fileSize.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|fileSize","targetName":"fileSize","vekterClass":"FrameNode"}};if (scope["__vekterVariables"]) { scope["__vekterVariables"].map(function(variable) { delete scope[variable] } ) };Object.assign(scope, {dropArea, ripple, contents, button, buttonText, uploadIcon, fileSize, file});scope["__vekterVariables"] = ["dropArea", "ripple", "contents", "button", "buttonText", "uploadIcon", "fileSize", "file"];if (typeof Framer.CurrentContext.layout === 'function') {Framer.CurrentContext.layout()};})(window);