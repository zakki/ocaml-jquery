(*
 * JQuery binding for Js_of_ocaml - 2011-2012  
 * jQuery module
 *
 * 2011 Gabriel Cardoso - gcardoso.w@gmail.com
 * 2012 Cagdas Bozman - cagdas.bozman@ocamlpro.com
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*)

open Js
open Effects

class type jQuery = object
  method add : js_string t -> jQuery t meth
  method add_element : #Dom_html.element t -> jQuery t meth
  method add_jquery : jQuery t -> jQuery t meth
  method addClass : js_string t -> jQuery t meth
  method addClass_ : (int -> js_string t -> js_string t) callback 
    -> jQuery t meth
  method after : (js_string t, #Dom_html.element t, jQuery t) Tools.Choice3.t
    -> jQuery t meth
  method after_fun : 
    (int -> (js_string t, #Dom_html.element t, jQuery t) Tools.Choice3.t) 
    -> jQuery t meth
  method ajaxComplete : 
    (#Dom_html.event t -> #XmlHttpRequest.xmlHttpRequest t -> 'a) callback
    -> jQuery t meth
  method animate : Dom_html.cssStyleDeclaration t -> duration_pre opt 
    -> easing_pre opt -> 'a callback opt -> jQuery t meth
  method append : js_string t -> jQuery t meth
  method appendTo : js_string t -> jQuery t meth
  method appendTo_jquery : jQuery t -> jQuery t meth
  method attr : js_string t -> js_string t optdef meth
  method attr_set : js_string t -> js_string t -> jQuery t meth
  method before : (js_string t, #Dom_html.element t, jQuery t) Tools.Choice3.t
    -> jQuery t meth
  method bind : js_string t -> 'a callback opt -> jQuery t meth
  method blur : 'a callback opt -> jQuery t meth
  method change : 'a callback opt -> jQuery t meth
  method clearQueue : js_string t opt -> jQuery t meth
  method click : 'a callback opt -> jQuery t meth
  method css_get : js_string t -> js_string t meth
  method css : js_string t -> js_string t -> jQuery t meth
  method delay : int -> js_string t opt -> jQuery t meth
  method dequeue : js_string t opt -> jQuery t meth
  method each : (int -> #Dom_html.element t -> 'a) callback -> jQuery t meth
  method eq : int -> jQuery t meth
  method fadeIn : duration_pre opt -> easing_pre opt -> 'a callback opt 
    -> jQuery t meth
  method fadeOut : duration_pre opt -> easing_pre opt -> 'a callback opt 
    -> jQuery t meth
  method fadeTo : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method fadeToggle : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method find : jQuery t -> jQuery t meth
  method focus : 'a callback opt -> jQuery t meth
  method has : js_string t -> jQuery t meth
  method hasClass : js_string t -> bool t meth
  method height : int meth
  method height_set : int -> jQuery t meth
  method hide : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method hover : 'a callback -> 'a callback opt -> jQuery t meth
  method html : js_string t meth 
  method html_set : js_string t -> jQuery t meth
  method insertAfter : (js_string t, #Dom_html.element t, jQuery t)
    Tools.Choice3.t -> jQuery t meth
  method insertBefore : (js_string t, #Dom_html.element t, jQuery t)
    Tools.Choice3.t -> jQuery t meth
  method length : int readonly_prop
  method live : 'a Dom.Event.typ -> 'a callback -> jQuery t meth
  method prepend : js_string t -> unit meth
  method queue : js_string t opt -> js_string t js_array t meth
  method ready : 'a callback -> jQuery t meth
  method remove : unit meth
  method removeClass : js_string t opt -> jQuery t meth
  method removeClass_ : (int -> js_string t -> js_string t) callback 
    -> jQuery t meth
  method select : 'a callback opt -> jQuery t meth
  method serialize : unit -> js_string meth
  method show : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method size : int meth
  method slideDown : duration_pre opt -> easing_pre opt -> 'a callback opt 
    -> jQuery t meth
  method slideToggle : duration_pre opt -> easing_pre opt -> 'a callback opt 
    -> jQuery t meth
  method slideUp : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method stop : bool t opt -> bool t opt -> jQuery t meth
  method submit : 'a callback opt -> jQuery t meth
  method toggle : bool t -> jQuery t meth
  method toggleClass : js_string t -> jQuery t meth
  method toggle_ : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth 
  method text : js_string t meth
  method text_set : js_string t -> jQuery t meth
  method unbind : js_string t -> jQuery t meth
  method val_ : string_array t meth
  method val_set : js_string t -> jQuery t meth
  method width : int meth
  method width_set : int -> jQuery t meth
  method tableFilter : unit meth
  method tableFilterApplyFilterValues : unit meth
end

class type ajaxSettings = object
  method accepts : 'a optdef_prop
  method async : bool t optdef_prop
  method beforeSend :
    (#XmlHttpRequest.xmlHttpRequest t -> ajaxSettings t -> 'a) callback optdef_prop
  method cache : bool t optdef_prop
  method complete :
    (#XmlHttpRequest.xmlHttpRequest t -> js_string t -> 'a) callback optdef_prop
  method contents : 'a optdef_prop
  method contentType  : js_string t optdef_prop
  method context : 'a optdef_prop
  method converters : 'a optdef_prop
  method crossDomain : bool t optdef_prop
  method data : 'a optdef_prop
  method dataFilter : ('a -> js_string t -> 'b) callback optdef_prop
  method dataType : js_string t optdef_prop
  method error :
    (#XmlHttpRequest.xmlHttpRequest t -> js_string t -> 'a -> 'b) callback optdef_prop
  method global : bool t optdef_prop
  method headers : 'a optdef_prop
  method ifModified : bool t optdef_prop
  method isLocal : bool t optdef_prop
  method jsonp : js_string t optdef_prop
  (* method jsonpCallback  : js_string t optdef_prop, function optdef_prop *)
  method mimeType : js_string t optdef_prop
  method password  : js_string t optdef_prop
  method processData : bool t optdef_prop
  method scriptCharset  : js_string t optdef_prop
  method statusCode : 'a optdef_prop
  method success :
    ('a -> js_string t -> #XmlHttpRequest.xmlHttpRequest t -> 'b) callback optdef_prop
  method timeout : float_prop
  method traditional: bool t optdef_prop
  method _type  : js_string t optdef_prop
  method url : js_string t optdef_prop
  method username  : js_string t optdef_prop
  method xhr : ('a -> 'b) callback optdef_prop
  method xhrFields : 'a optdef_prop
end

(** Easy way to call the jQuery object jQ "#foo" <=> $("#foo") **)
val jQ : string -> jQuery t

(** Call the jQuery object i.e. "$" in jQuery **)
val jQuery : (js_string t, #Dom_html.element t, #Dom_html.element t js_array t,
	      jQuery t) Tools.Choice4.t ->
              (#Dom_html.element t, #Dom_html.document, 
	       jQuery t) Tools.Choice3.t opt -> jQuery t


val ajax : js_string t -> unit
val param : Unsafe.any t -> bool t opt -> js_string t

val new_ajax_setting : unit -> ajaxSettings t
val ajax_setting : ajaxSettings t -> unit
