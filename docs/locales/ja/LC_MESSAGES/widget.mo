Þ    J      l              ¼    ½     Ù     í     û     	  G   "  ¹   j  <   $  ]   a  ?   ¿     ÿ      	     .
  U   ²
       Ø     6   t  \   «       §     n   8     §  *   3  	   ^  8   h     ¡  á   ¹  ´       P  º   å  X      c   ù     ]     é  þ     Ø        Y     p       9     u   Ö  I   L       K     Å   f  w   ,  ý   ¤  º   ¢     ]     Ý     ø  #     *   3  #   ^       7    7   Ò  X   
  V   c     º    Á  ö   Î!  ´   Å"  &   z#  &   ¡#     È#  $   Q$  &   v$     $  6   ¥$     Ü$  Ý   ú$     Ø%    é%  Á  '     H*     b*  
   o*  *   z*  g   ¥*  á   +  U   ï+     E,  [   ×,  Õ   3-  Ý   	.  §   ç.  f   /  Ñ   ö/  /  È0  ]   ø1  ¨   V2  Ò   ÿ2  Ø   Ò3     «4  Û   ?5  I   6     e6  Z   l6     Ç6  v  ç6    ^8  ÿ   {:    {;  £   <  £   &=  "   Ê=    í=  ½  ú>  A  ¸@  "   úA  -   B  $   KB  P   pB  v   ÁB  z   8C  ¤   ³C  µ   XD  ?  E  Þ   NF  R  -G    H  º   I  *   AJ  !   lJ  (   J  E   ·J  !   ýJ     K  Ý  >K  h   M  x   M  |   þM     {N  q  N  ¢  	R  ×   ¬S  8   T  5   ½T  ½   óT  4   ±U  3   æU     V  K   'V  (   sV  7  V     ÔW   *(Changed in version 1.16.0)* MuPDF no longer treats widgets as a subset of general annotations. Consequently, :attr:`Page.first_annot` and :meth:`Annot.next` will deliver **non-widget annotations exclusively**, and be *None* if only form fields exist on a page. Vice versa, :attr:`Page.first_widget` and :meth:`Widget.next` will only show widgets. This design decision is purely internal to MuPDF; technically, links, annotations and fields have a lot in common and also continue to share the better part of their code within (Py-) MuPDF. **Base14 Fontname** **Class API** **Reference** *New in version 1.18.15* A bool indicating the signing status of a signature field, else *None*. A float defining the text :data:`fontsize`. Default value is zero, which causes PDF viewer software to dynamically choose a size suitable for the annotation's rectangle and text amount. A float defining the width of the border line. Default is 1. A list of **1, 3 or 4 floats** defining the text color. Default value is black (`[0, 0, 0]`). A list of up to 4 floats defining the field's background color. A list of up to 4 floats defining the field's border color. Default value is *None* which causes border style and border width to be ignored. A list/tuple of integers defining the dash properties of the border line. This is only meaningful if *border_style == "D"* and :attr:`border_color` is provided. A mandatory integer defining the field type. This is a value in the range of 0 to 6. It cannot be changed when updating the widget. A mandatory string defining the field's name. No checking for duplicates takes place. A string defining the font to be used. Default and replacement for invalid values is *"Helv"*. For valid font reference names see the table below. A string defining the line style of the field's border. See :attr:`Annot.border`. Default is "s" ("Solid") -- a continuous line. Only the first character (upper or lower case) will be regarded when creating a widget. A string describing (and derived from) the field type. After any changes to a widget, this method **must be used** to store them in the PDF [#f1]_. An integer defining a large amount of properties of a field. Be careful when changing this attribute as this may change the field type. An integer defining acceptable text types (e.g. numeric, date, time, etc.). For reference only for the time being -- will be ignored when creating or updating widgets. An integer defining the maximum number of text characters. PDF viewers will (should) not accept a longer text. An optional string containing an "alternate" field name. Typically used for any notes, help on field usage, etc. Default is the field name. Button fields only support :attr:`script`. Footnotes For **adding** or **changing** one of the above scripts, Helvetica **(default)** If you intend to re-access a new or updated field (e.g. for making a pixmap), make sure to reload the page first. Either close and re-open the document, or load another page first, or simply do `page = doc.reload_page(page)`. It is worthwhile to look at `this <https://experienceleague.adobe.com/docs/experience-manager-learn/assets/FormsAPIReference.pdf?lang=en>`_ manual with lots of information about Adobe's standard scripts for various field types. For example, if you want to add a text field representing a date, you may want to store the following scripts. They will ensure pattern-compatible date formats and display date pickers in supporting viewers:: JavaScript text (unicode) for an action associated with the widget, or *None*. This is the only script action supported for **button type** widgets. JavaScript text (unicode) to be performed before the field is formatted to display its current value. This action can modify the fieldâs value before formatting. *None* if not present. JavaScript text (unicode) to be performed on focusing this field. *None* if not present. JavaScript text (unicode) to be performed on losing the focus of this field. *None* if not present. JavaScript text (unicode) to be performed to recalculate the value of this field when that of another field changes. *None* if not present. JavaScript text (unicode) to be performed when the fieldâs value is changed. This action can check the new value for validity. *None* if not present. JavaScript text (unicode) to be performed when the user types a key-stroke into a text field or combo box or modifies the selection in a scrollable list box. This action can check the keystroke for validity and reject or modify it. *None* if not present. Like annotations, widgets live on PDF pages. Similar to annotations, the first widget on a page is accessible via :attr:`Page.first_widget` and subsequent widgets can be accessed via the :attr:`Widget.next` property. New in version 1.16.12 New in version 1.22.2 New in version 1.22.6 Other script entries will automatically be set to *None*. PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript Point to the next form field on the page. The last widget returns *None*. PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. PyMuPDF supports the creation and update of many, but not all widget types. Python sequence of strings defining the valid choices of list boxes and combo boxes. For these widget types, this property is mandatory and must contain at least two items. Ignored for other types. Reset the field's value to its default -- if defined -- or remove it. Do not forget to issue :meth:`update` afterwards. Return the names of On / Off (i.e. selected / clicked or not) states a button field may have. While the 'Off' state usually is also named like so, the 'On' state is often given a name relating to the functional context, for example 'Yes', 'Female', etc. Return the value of the "ON" state of check boxes and radio buttons. For check boxes this is always the value "Yes". For radio buttons, this is the value to select / activate the button. So for check boxes and radio buttons, the recommended method to set them to "selected", or to check the state is the following: Standard Fonts for Widgets Supported Widget Types The PDF :data:`xref` of the widget. The caption string of a button-type field. The rectangle containing the field. The value of the field. This class represents a PDF Form field, also called a "widget". Throughout this documentation, we are using these terms synonymously. Fields technically are a special case of PDF annotations, which allow users with limited permissions to enter information in a PDF. This is primarily used for filling out forms. This documentation covers all versions up to |version|. This method helps finding out the possible values of :attr:`field_value` in these cases. To find out already existing field fonts, inspect the list :attr:`Document.FormFonts`. Widget Widgets use their own resources object */DR*. A widget resources object must at least contain a */Font* object. Widget fonts are independent from page fonts. We currently support the 14 PDF base fonts using the following fixed reference names, or any name of an already existing field font. When specifying a text font for new or changed widgets, **either** choose one in the first table column (upper and lower case supported), **or** one of the already existing form fonts. In the latter case, spelling must exactly match. You are generally free to use any font for every widget. However, we recommend using *ZaDb* ("ZapfDingbats") and :data:`fontsize` 0 for check boxes: typical viewers will put a correctly sized tickmark in the field's rectangle, when it is clicked. a dictionary with the names of 'On' and 'Off' for the *normal* and the *pressed-down* appearance of button widgets. The following example shows that the "selected" value is "Male": check box (`PDF_WIDGET_TYPE_CHECKBOX`) combo box (`PDF_WIDGET_TYPE_COMBOBOX`) just put the appropriate JavaScript source code in the widget attribute. To **remove** a script, set the respective attribute to *None*. list box (`PDF_WIDGET_TYPE_LISTBOX`) push button (`PDF_WIDGET_TYPE_BUTTON`) returns signature (`PDF_WIDGET_TYPE_SIGNATURE`) **read only**. text (`PDF_WIDGET_TYPE_TEXT`) the value that sets the button to "selected". For non-checkbox, non-radiobutton fields, always `None` is returned. For check boxes the return is `True`. For radio buttons this is the value "Male" in the following example: |pdf_only_class| Project-Id-Version: PyMuPDF 1.23.0rc1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2024-05-01 16:48+0100
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Suzan Sanver <suzan.sanver@dijipiji.com>
Language: ja
Language-Team: ja <suzan.sanver@dijipiji.com>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.10.3
 *ï¼ãã¼ã¸ã§ã³1.16.0ã§å¤æ´ï¼* MuPDFã¯ã¦ã£ã¸ã§ãããä¸è¬çãªæ³¨éã®ãµãã»ããã¨ãã¦æ±ããªããªãã¾ããããããã£ã¦ã:attr:`Page.first_annot` ããã³ :meth:`Annot.next` ã¯éã¦ã£ã¸ã§ããæ³¨éã®ã¿ãè¿ãããã¼ã¸ã«ãã©ã¼ã ãã£ã¼ã«ãã®ã¿ãå­å¨ããå ´åã¯Noneãè¿ãã¾ããéã«ã:attr:`Page.first_widget` ããã³ :meth:`Widget.next` ã¯ã¦ã£ã¸ã§ããã®ã¿ãè¡¨ç¤ºãã¾ãããã®è¨­è¨ã®æ±ºå®ã¯MuPDFåé¨ã«ããããã®ã§ãããæè¡çã«ã¯ãªã³ã¯ãæ³¨éãããã³ãã£ã¼ã«ãã¯å¤ãã®å±éç¹ãæã¡ãã¾ãï¼Py-ï¼MuPDFåã§ã³ã¼ãã®å¤§é¨åãå±æãç¶ãã¦ãã¾ãã **Base14ãã©ã³ãå** ã¯ã©ã¹API **åç§** *ãã¼ã¸ã§ã³1.18.15ã§æ°ããè¿½å * ç½²åãã£ã¼ã«ãã®ç½²åã¹ãã¼ã¿ã¹ãç¤ºããã¼ã«å¤ãããä»¥å¤ã®å ´åã¯ *None*ã ãã­ã¹ãã® :data:`fontsize` ãå®ç¾©ããæµ®åå°æ°ç¹æ°ãããã©ã«ãå¤ã¯ã¼ã­ã§ãPDFãã¥ã¼ã¢ã½ããã¦ã§ã¢ãæ³¨éã®ç©å½¢ã¨ãã­ã¹ãã®éã«é©ãããµã¤ãºãåçã«é¸æãã¾ãã å¢çç·ã®å¹ãå®ç¾©ããæµ®åå°æ°ç¹æ°ã§ããããã©ã«ãã¯1ã§ãã ãã­ã¹ãã®è²ãå®ç¾©ããã**1ã3ãã¾ãã¯4ã¤ã®æµ®åå°æ°ç¹æ°** ã®ãªã¹ããããã©ã«ãå¤ã¯é» (`[0, 0, 0]`)ã§ãã ãã£ã¼ã«ãã®èæ¯è²ãå®ç¾©ãããæå¤§4ã¤ã®æµ®åå°æ°ç¹æ°ã®ãªã¹ãã ãã£ã¼ã«ãã®å¢çç·ã®è²ãå®ç¾©ããæå¤§4ã¤ã®æµ®åå°æ°ç¹æ°ã®ãªã¹ãã§ããããã©ã«ãå¤ã¯ *None* ã§ãããã«ããå¢çç·ã¹ã¿ã¤ã«ã¨å¢çç·ã®å¹ãç¡è¦ããã¾ãã *border_style == "D"* ã§ããã:attr:`border_color` ãæå®ããã¦ããå ´åã«ã®ã¿æå³ãããã¾ããããã¯ãå¢çç·ã®ããã·ã¥ãã­ããã£ãå®ç¾©ããæ´æ°ã®ãªã¹ã/ã¿ãã«ã§ãã ãã£ã¼ã«ãã¿ã¤ããå®ç¾©ããå¿é ã®æ´æ°ã§ããããã¯0ãã6ã®ç¯å²ã®å¤ã§ããã¦ã£ã¸ã§ãããæ´æ°ããéã«å¤æ´ã§ãã¾ããã ãã£ã¼ã«ãã®ååãå®ç¾©ããå¿é ã®æå­åã§ããéè¤ããã§ãã¯ãã¾ããã ä½¿ç¨ãããã©ã³ããå®ç¾©ããæå­åãããã©ã«ãããã³ç¡å¹ãªå¤ã®ç½®æã¯ *ãHelvã* ã§ããæå¹ãªãã©ã³ãåç§åã«ã¤ãã¦ã¯ä»¥ä¸ã®è¡¨ãåç§ãã¦ãã ããã ãã£ã¼ã«ãã®å¢çç·ã®ç·ã¹ã¿ã¤ã«ãå®ç¾©ããæå­åã§ãã:attr:`Annot.border` ãåç§ãã¦ãã ãããããã©ã«ãã¯ "s" ("Solid") ã§ãé£ç¶ç·ã§ããã¦ã£ã¸ã§ãããä½æããéãæåã®æå­ï¼å¤§æå­ã¾ãã¯å°æå­ï¼ã®ã¿ãèæ®ããã¾ãã ãã£ã¼ã«ãã¿ã¤ããèª¬æããæå­åï¼ãã£ã¼ã«ãã¿ã¤ãããæ´¾çï¼ã ã¦ã£ã¸ã§ããã«å¤æ´ãå ããããå¾ããããã®å¤æ´ãPDFã«ä¿å­ããããã«ãã®ã¡ã½ããã **ä½¿ç¨ããå¿è¦ãããã¾ã** [#f1]_ã ãã£ã¼ã«ãã®å¤ãã®ãã­ããã£ãå®ç¾©ããæ´æ°ã§ãããã®å±æ§ãå¤æ´ããéã¯æ³¨æãã¦ãã ãããããã¯ãã£ã¼ã«ãã®ã¿ã¤ããå¤æ´ããå¯è½æ§ãããã¾ãã è¨±å®¹å¯è½ãªãã­ã¹ãã¿ã¤ããå®ç¾©ããæ´æ°ï¼ä¾ï¼æ°å¤ãæ¥ä»ãæå»ãªã©ï¼ãç¾æç¹ã§ã¯åèç¨ã®ã¿ã§ãã¦ã£ã¸ã§ãããä½æã¾ãã¯æ´æ°ããéã«ã¯ç¡è¦ããã¾ãã ãã­ã¹ãã®æå¤§æå­æ°ãå®ç¾©ããæ´æ°ãPDFãã¥ã¼ã¢ã¯ï¼ããã¯ãã§ãï¼ããé·ããã­ã¹ããåãå¥ãã¾ããã ãä»£æ¿ããã£ã¼ã«ãåãå«ããªãã·ã§ã³ã®æå­åã§ããéå¸¸ããã£ã¼ã«ãã®ä½¿ç¨æ¹æ³ã«é¢ããã¡ã¢ããã«ããªã©ã«ä½¿ç¨ããã¾ããããã©ã«ãã¯ãã£ã¼ã«ãåã§ãã ãã¿ã³ãã£ã¼ã«ãã¯ :attr:`script` ããµãã¼ããã¦ãã¾ã èæ³¨ ä¸è¨ã®ããããã®ã¹ã¯ãªããã **è¿½å ** ã¾ãã¯ **å¤æ´** ããã«ã¯ã Helvetica **(ããã©ã«ã)** æ°ããã¾ãã¯æ´æ°ããããã£ã¼ã«ãã«åã¢ã¯ã»ã¹ããæå³ãããå ´åï¼ãã¨ãã°ããã¯ã»ã«ããããä½æããå ´åï¼ãã¾ããã¼ã¸ãåèª­ã¿è¾¼ããã¨ãç¢ºèªãã¦ãã ãããææ¸ãéãã¦ååº¦éãããå¥ã®ãã¼ã¸ãèª­ã¿è¾¼ãããã¾ãã¯åã« `page = doc.reload_page(page)` ãå®è¡ãã¦ãã ãã Adobeã®æ¨æºã¹ã¯ãªããã«é¢ããå¤ãã®æå ±ãå«ã¾ãã¦ãã `ãã® <https://experienceleague.adobe.com/docs/experience-manager-learn/assets/FormsAPIReference.pdf?lang=en>`_ ããã¥ã¢ã«ãç¢ºèªããä¾¡å¤ãããã¾ãããã¨ãã°ãæ¥ä»ãè¡¨ããã­ã¹ããã£ã¼ã«ããè¿½å ããå ´åãæ¬¡ã®ã¹ã¯ãªãããä¿å­ãããã¨ãã§ãã¾ããããã«ããããã¿ã¼ã³äºæã®æ¥ä»å½¢å¼ãç¢ºä¿ããããµãã¼ãããã¦ãããã¥ã¼ã¢ã§æ¥ä»ããã«ã¼ãè¡¨ç¤ºããã¾ãã ã¦ã£ã¸ã§ããã«é¢é£ä»ããããã¢ã¯ã·ã§ã³ç¨ã®JavaScriptãã­ã¹ãï¼Unicodeï¼ãã¾ãã¯ *None*ãããã¯ **ãã¿ã³ã¿ã¤ã** ã®ã¦ã£ã¸ã§ããã«å¯¾ãã¦ãµãã¼ããããå¯ä¸ã®ã¹ã¯ãªããã¢ã¯ã·ã§ã³ã§ãã ãã®ã¢ã¯ã·ã§ã³ã¯ããã£ã¼ã«ããç¾å¨ã®å¤ãè¡¨ç¤ºããããã«ãã©ã¼ããããããåã«ããã£ã¼ã«ãã®å¤ãå¤æ´ããããã«å®è¡ãããJavaScriptãã­ã¹ãï¼Unicodeï¼ã§ããå­å¨ããªãå ´åã¯ *None* ã§ãã ãã®ãã£ã¼ã«ãã«ãã©ã¼ã«ã¹ãå½ãã£ãã¨ãã«å®è¡ãããJavaScriptãã­ã¹ãï¼Unicodeï¼ã§ããå­å¨ããªãå ´åã¯ *None* ã§ãã ãã®ãã£ã¼ã«ããããã©ã¼ã«ã¹ãå¤±ã£ãã¨ãã«å®è¡ãããJavaScriptãã­ã¹ãï¼Unicodeï¼ã§ããå­å¨ããªãå ´åã¯ *None* ã§ãã ãã¼ã¸ã§ã³1.16.12ã§æ°è¦è¿½ ãã®ã¢ã¯ã·ã§ã³ã¯ããã£ã¼ã«ãã®å¤ãå¤æ´ãããã¨ãã«å®è¡ãããJavaScriptãã­ã¹ãï¼Unicodeï¼ã§ãããã®ã¢ã¯ã·ã§ã³ã¯æ°ããå¤ã®å¦¥å½æ§ããã§ãã¯ãããã¨ãã§ãã¾ããå­å¨ããªãå ´åã¯ *None* ã§ãã JavaScriptãã­ã¹ãï¼Unicodeï¼ã¯ãã¦ã¼ã¶ã¼ããã­ã¹ããã£ã¼ã«ãã¾ãã¯ã³ã³ãããã¯ã¹ã«ã­ã¼ã¹ãã­ã¼ã¯ãå¥åããããã¹ã¯ã­ã¼ã«å¯è½ãªãªã¹ãããã¯ã¹ã®é¸æãå¤æ´ããã¨ãã«å®è¡ãããã¢ã¯ã·ã§ã³ã§ãããã®ã¢ã¯ã·ã§ã³ã¯ã­ã¼ã¹ãã­ã¼ã¯ã®å¦¥å½æ§ããã§ãã¯ããæå¦ã¾ãã¯å¤æ´ãããã¨ãã§ãã¾ããå­å¨ããªãå ´åã¯ *None* ã§ãã ã¢ããã¼ã·ã§ã³ã¨åæ§ã«ãã¦ã£ã¸ã§ãããPDFãã¼ã¸ä¸ã«å­å¨ãã¾ããæ³¨éã¨åæ§ã«ããã¼ã¸ä¸ã®æåã®ã¦ã£ã¸ã§ããã¯ :attr:`Page.first_widget` çµç±ã§ã¢ã¯ã»ã¹ã§ãããã®å¾ã®ã¦ã£ã¸ã§ããã¯ :attr:`Widget.next` ãã­ããã£çµç±ã§ã¢ã¯ã»ã¹ã§ãã¾ãã ãã¼ã¸ã§ã³1.16.12ã§æ°ç»å ´ æ°æ©è½ï¼ãã¼ã¸ã§ã³1.22.2ã§è¿½å ï¼ ãã¼ã¸ã§ã³1.22.6ã§æ°è¦è¿½å  ä»ã®ã¹ã¯ãªããã¨ã³ããªã¯èªåçã« *None* ã«è¨­å®ããã¾ãã PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript ãã¼ã¸ä¸ã®æ¬¡ã®ãã©ã¼ã ãã£ã¼ã«ããæãã¾ããæå¾ã®ã¦ã£ã¸ã§ããã¯ *None* ãè¿ãã¾ãã PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã PyMuPDFã¯ãå¤ãã®ã¦ã£ã¸ã§ããã¿ã¤ãã®ä½æããã³æ´æ°ããµãã¼ããã¦ãã¾ããããã¹ã¦ã®ã¦ã£ã¸ã§ããã¿ã¤ãã«ã¯å¯¾å¿ãã¦ãã¾ããã ãªã¹ãããã¯ã¹ã¨ã³ã³ãããã¯ã¹ã®æå¹ãªé¸æè¢ãå®ç¾©ããPythonã·ã¼ã±ã³ã¹ã®æå­åã§ãããããã®ã¦ã£ã¸ã§ããã¿ã¤ãã§ã¯ããã®ãã­ããã£ãå¿é ã§ãå°ãªãã¨ã2ã¤ã®ã¢ã¤ãã ãå«ããå¿è¦ãããã¾ããä»ã®ã¿ã¤ãã§ã¯ç¡è¦ããã¾ãã ãã£ã¼ã«ãã®å¤ãããã©ã«ãå¤ã«ãªã»ãããã¾ããããã©ã«ããå®ç¾©ããã¦ããå ´åããããåé¤ãã¾ãããã®å¾ã:meth:`update` ãå®è¡ããã®ãå¿ããªãã§ãã ããã ãã¿ã³ãã£ã¼ã«ããæã¤On / Offï¼é¸æ/ã¯ãªãã¯ãããã©ããï¼ç¶æã®ååãè¿ãã¾ããéå¸¸ã 'Off'ç¶æãåæ§ã«ååãä»ãããã¦ãã¾ããã 'On'ç¶æã¯æ©è½çãªã³ã³ãã­ã¹ãã«é¢é£ããååãããä»ãããã¾ãããã¨ãã°ããYesãããFemaleããªã©ã§ãã ãã§ãã¯ããã¯ã¹ã¨ã©ã¸ãªãã¿ã³ã®ãONãç¶æã®å¤ãè¿ãã¾ãããã§ãã¯ããã¯ã¹ã®å ´åãããã¯å¸¸ã«ãYesãã¨ããå¤ã§ããã©ã¸ãªãã¿ã³ã®å ´åãããã¯ãã¿ã³ãé¸æ/ã¢ã¯ãã£ãåããå¤ã§ãã ãããã£ã¦ããã§ãã¯ããã¯ã¹ã¨ã©ã¸ãªãã¿ã³ã®å ´åããããããé¸æãã¾ãã¯ç¶æãç¢ºèªããããã®æ¨å¥¨ãããæ¹æ³ã¯æ¬¡ã®ã¨ããã§ãã ã¦ã£ã¸ã§ããç¨ã®æ¨æºãã©ã³ã å¯¾å¿ã¦ã£ã¸ã§ããã®ç¨®é¡ ã¦ã£ã¸ã§ããã®PDF :data:`xref`ã ãã¿ã³ã¿ã¤ãã®ãã£ã¼ã«ãã®ã­ã£ãã·ã§ã³æå­åã ãã£ã¼ã«ããå«ãç©å½¢ã ãã£ã¼ã«ãã®å¤ã§ãã ãã®ã¯ã©ã¹ã¯ãPDFãã©ã¼ã ãã£ã¼ã«ããã¾ãã¯ãã¦ã£ã¸ã§ãããã¨ãå¼ã°ãããã®ãè¡¨ãã¾ãããã®ãã­ã¥ã¡ã³ãã¼ã·ã§ã³å¨ä½ã§ããããã®ç¨èªãåç¾©èªã¨ãã¦ä½¿ç¨ãã¦ãã¾ãããã£ã¼ã«ãã¯æè¡çã«ã¯PDFæ³¨éã®ç¹æ®ãªã±ã¼ã¹ã§ãããå¶éä»ãã®æ¨©éãæã¤ã¦ã¼ã¶ã¼ãPDFã«æå ±ãå¥åãããã¨ãå¯è½ã«ãã¾ããããã¯ä¸»ã«ãã©ã¼ã ã®è¨å¥ã«ä½¿ç¨ããã¾ãã ãã®ãã­ã¥ã¡ã³ãã¯ |version| ã¾ã§ã®ãã¹ã¦ã®ãã¼ã¸ã§ã³ãå¯¾è±¡ã¨ãã¦ãã¾ãã ãã®ã¡ã½ããã¯ããããã®ã±ã¼ã¹ã§ :attr:`field_value` ã®å¯è½ãªå¤ãèª¿ã¹ãã®ã«å½¹ç«ã¡ã¾ãã æ¢å­ã®ãã£ã¼ã«ããã©ã³ããè¦ã¤ããã«ã¯ããªã¹ã :attr:`Document.FormFonts` ãèª¿ã¹ã¦ãã ããã Widget (ã¦ã£ã¸ã§ãã) ã¦ã£ã¸ã§ããã¯ç¬èªã®ãªã½ã¼ã¹ãªãã¸ã§ã¯ã */DR* ãä½¿ç¨ãã¾ããã¦ã£ã¸ã§ããã®ãªã½ã¼ã¹ãªãã¸ã§ã¯ãã«ã¯ãå°ãªãã¨ã */Font* ãªãã¸ã§ã¯ããå«ããå¿è¦ãããã¾ããã¦ã£ã¸ã§ãããã©ã³ãã¯ãã¼ã¸ãã©ã³ãã¨ã¯ç¬ç«ãã¦ãã¾ããç¾å¨ãä»¥ä¸ã®åºå®åç§åãä½¿ç¨ãã¦ã14ã®PDFãã¼ã¹ãã©ã³ãããµãã¼ããã¦ãã¾ããã¾ããæ¢å­ã®ãã£ã¼ã«ããã©ã³ãã®ååã§ããã¾ãã¾ãããæ°ããã¦ã£ã¸ã§ããã¾ãã¯å¤æ´ãããã¦ã£ã¸ã§ããã®ãã­ã¹ããã©ã³ããæå®ããéã«ã¯ãæåã®è¡¨ã®åï¼å¤§æå­ã¨å°æå­ããµãã¼ãããã¦ãã¾ãï¼ãã1ã¤ãé¸æããããæ¢å­ã®ãã©ã¼ã ãã©ã³ãã®1ã¤ãé¸æãã¦ãã ãããå¾èã®å ´åãã¹ãã«ã¯å³å¯ã«ä¸è´ããå¿è¦ãããã¾ãã ä¸è¬çã«ããã¹ã¦ã®ã¦ã£ã¸ã§ããã«ä»»æã®ãã©ã³ããä½¿ç¨ãããã¨ãã§ãã¾ãããã ãããã§ãã¯ããã¯ã¹ã«ã¯ *ZaDb* ï¼ãZapfDingbatsãï¼ãã©ã³ãã¨ :data:`fontsize`  0ãä½¿ç¨ãããã¨ããå§ããã¾ããå¸åçãªãã¥ã¼ã¢ã¯ããã£ã¼ã«ãã®åè§å½¢ãã¯ãªãã¯ããã¨æ­£ãããµã¤ãºèª¿æ´ããããã§ãã¯ãã¼ã¯ãéç½®ãã¾ãã *normal* ã® ç¶æã¨ *pressed-down* ç¶æã®ãã¿ã³ã¦ã£ã¸ã§ããã® 'On'ã¨ 'Off'ã®ååãæã¤è¾æ¸ãæ¬¡ã®ä¾ã§ã¯ããé¸æããããå¤ã¯ãMaleãã§ãããã¨ãç¤ºããã¦ãã¾ãï¼ ãã§ãã¯ããã¯ã¹ï¼`PDF_WIDGET_TYPE_CHECKBOX`ï¼ ã³ã³ãããã¯ã¹ï¼`PDF_WIDGET_TYPE_COMBOBOX`ï¼ é©åãªJavaScriptã½ã¼ã¹ã³ã¼ããã¦ã£ã¸ã§ããå±æ§ã«éç½®ããã ãã§ããã¹ã¯ãªããã **åé¤ãã** ã«ã¯ãè©²å½ããå±æ§ã *None* ã«è¨­å®ãã¾ãã ãªã¹ãããã¯ã¹ï¼`PDF_WIDGET_TYPE_LISTBOX`ï¼ ããã·ã¥ãã¿ã³ï¼`PDF_WIDGET_TYPE_BUTTON`ï¼ æ»ãå¤ï¼ ç½²åï¼`PDF_WIDGET_TYPE_SIGNATURE`ï¼ã¯ **èª­ã¿åãå°ç¨ã§ã** ã ãã­ã¹ãï¼`PDF_WIDGET_TYPE_TEXT`ï¼ ãã¿ã³ããé¸æãã«è¨­å®ããå¤ãè¿ããã¾ããéãã§ãã¯ããã¯ã¹ãéã©ã¸ãªãã¿ã³ãã£ã¼ã«ãã®å ´åãå¸¸ã« `None` ãè¿ããã¾ãããã§ãã¯ããã¯ã¹ã®å ´åãæ»ãå¤ã¯ `True` ã§ããã©ã¸ãªãã¿ã³ã®å ´åãæ¬¡ã®ä¾ã§ã¯å¤ããMaleãã§ãã PDFã®ã¿ã 