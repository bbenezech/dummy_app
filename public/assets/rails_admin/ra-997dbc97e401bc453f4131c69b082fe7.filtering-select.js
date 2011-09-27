/*
 * RailsAdmin filtering select @VERSION
 *
 * Based on the combobox example from jQuery UI documentation
 * http://jqueryui.com/demos/autocomplete/#combobox
 *
 * License
 *
 * http://www.railsadmin.org
 *
 * Depends:
 *   jquery.ui.core.js
 *   jquery.ui.widget.js
 *   jquery.ui.autocomplete.js
 */
(function(a){a.widget("ra.filteringSelect",{options:{createQuery:function(a){return{query:a}},minLength:0,searchDelay:200,source:null},_create:function(){var b=this,c=this.element.hide(),d=c.children(":selected"),e=d.val()?d.text():"";this.options.source||(this.options.source=c.children("option").map(function(){return{label:a(this).text(),value:this.value}}).toArray());var f=a("<div class='input-append'></div>"),g=this.input=a("<input>").val(e).addClass("ra-filtering-select-input").attr("style",c.attr("style")).show().autocomplete({delay:this.options.searchDelay,minLength:this.options.minLength,source:this._getSourceFunction(this.options.source),select:function(d,e){var f=a('<option value="'+e.item.id+'" selected="selected">'+e.item.value+"</option>");c.html(f),b._trigger("selected",d,{item:f})},change:function(b,d){if(!d.item){var e=new RegExp("^"+a.ui.autocomplete.escapeRegex(a(this).val())+"$","i"),f=!1;c.children("option").each(function(){if(a(this).text().match(e))return this.selected=f=!0,!1});if(!f)return a(this).val(""),c.val(""),g.data("autocomplete").term="",!1}}});g.data("autocomplete")._renderItem=function(b,c){return a("<li></li>").data("item.autocomplete",c).append("<a>"+c.label||c.id+"</a>").appendTo(b)};var h=this.button=a("<label class='add-on'>&nbsp;</label>").attr("title","Show All Items").button({icons:{primary:"ui-icon-triangle-1-s"},text:!1}).click(function(){if(g.autocomplete("widget").is(":visible")){g.autocomplete("close");return}g.autocomplete("search",""),g.focus()});f.append(g).append(h).insertAfter(c)},_getResultSet:function(b,c,d){var e=new RegExp(a.ui.autocomplete.escapeRegex(b.term),"i");return a.map(c,function(c,f){if((c.id||c.value)&&(d||e.test(c.label)))return{label:c.label?c.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)("+a.ui.autocomplete.escapeRegex(b.term)+")(?![^<>]*>)(?![^&;]+;)","gi"),"<strong>$1</strong>"):c.id,value:c.label||c.id,id:c.id||c.value}})},_getSourceFunction:function(b){var c=this,d=0;return a.isArray(b)?function(a,d){d(c._getResultSet(a,b,!1))}:typeof b=="string"?function(e,f){this.xhr&&this.xhr.abort(),this.xhr=a.ajax({url:b,data:c.options.createQuery(e.term),dataType:"json",autocompleteRequest:++d,success:function(a,b){this.autocompleteRequest===d&&f(c._getResultSet(e,a,!0))},error:function(){this.autocompleteRequest===d&&f([])}})}:b},destroy:function(){this.input.remove(),this.button.remove(),this.element.show(),a.Widget.prototype.destroy.call(this)}})})(jQuery)