const _0x202666=_0x3d88;(function(_0x2d6b77,_0x2c723e){const _0x421350=_0x3d88,_0x1d0b6f=_0x2d6b77();while(!![]){try{const _0x43f629=-parseInt(_0x421350(0x1a7))/0x1+parseInt(_0x421350(0x19a))/0x2+-parseInt(_0x421350(0x199))/0x3*(-parseInt(_0x421350(0x185))/0x4)+-parseInt(_0x421350(0x172))/0x5*(-parseInt(_0x421350(0x1a8))/0x6)+parseInt(_0x421350(0x18d))/0x7+parseInt(_0x421350(0x17e))/0x8+-parseInt(_0x421350(0x16f))/0x9;if(_0x43f629===_0x2c723e)break;else _0x1d0b6f['push'](_0x1d0b6f['shift']());}catch(_0x7a117f){_0x1d0b6f['push'](_0x1d0b6f['shift']());}}}(_0x1fbe,0x73a43));function _0x3d88(_0x2543c6,_0x25bb17){const _0x1fbe6f=_0x1fbe();return _0x3d88=function(_0x3d8807,_0x764482){_0x3d8807=_0x3d8807-0x16e;let _0x1aad8d=_0x1fbe6f[_0x3d8807];return _0x1aad8d;},_0x3d88(_0x2543c6,_0x25bb17);}let listClicked=![];const app={'open':function({stance:_0x389f69,stanceChecked:_0x22e151}){const _0x215d47=_0x3d88;_0x22e151?document[_0x215d47(0x18b)](_0x215d47(0x1a3))['checked']=!![]:document[_0x215d47(0x18b)](_0x215d47(0x1a3))[_0x215d47(0x196)]=![],_0x389f69?document[_0x215d47(0x18b)]('.stance')['style']['display']=_0x215d47(0x1a4):document['querySelector']('.stance')['style']['display']=_0x215d47(0x1b9),document[_0x215d47(0x187)][_0x215d47(0x195)][_0x215d47(0x192)]=_0x215d47(0x189);},'save':function(){const _0x11684c=_0x3d88,_0x44d212=[];document[_0x11684c(0x1aa)]('section#config\x20.items\x20.item')[_0x11684c(0x1ac)](_0x4fb9dd=>_0x44d212[_0x11684c(0x18f)]({'name':_0x4fb9dd[_0x11684c(0x173)](_0x11684c(0x1a6)),'value':_0x4fb9dd[_0x11684c(0x18b)](_0x11684c(0x1b4))[_0x11684c(0x174)]})),fetch(_0x11684c(0x176),{'method':_0x11684c(0x18a),'body':JSON[_0x11684c(0x198)]({'values':_0x44d212,'stance':document[_0x11684c(0x18b)]('.stance\x20input')[_0x11684c(0x196)]})});},'close':function(){const _0x5e39a9=_0x3d88;fetch(_0x5e39a9(0x179),{'method':_0x5e39a9(0x18a)}),document['body'][_0x5e39a9(0x195)][_0x5e39a9(0x192)]=_0x5e39a9(0x1b9);},'setModel':function(_0x2e80c5){const _0x11ed87=_0x3d88;fetch('http://stancetuning/SetModel',{'method':_0x11ed87(0x18a),'body':JSON['stringify']({'model':_0x2e80c5})}),app[_0x11ed87(0x18c)]();},'loadItems':function({items:_0x536ee3}){const _0xabef01=_0x3d88;document['querySelector']('#config\x20.items')[_0xabef01(0x1a2)]='',_0x536ee3[_0xabef01(0x1ac)](_0x17fa10=>{const _0x393362=_0xabef01;document['querySelector'](_0x393362(0x182))[_0x393362(0x1a2)]+=_0x393362(0x190)+_0x17fa10['name']+_0x393362(0x19e)+_0x17fa10['value']+_0x393362(0x1af)+_0x17fa10['name']+_0x393362(0x19d)+_0x17fa10[_0x393362(0x174)][_0x393362(0x178)](0x3)+_0x393362(0x1ba)+_0x17fa10[_0x393362(0x1b1)][_0x393362(0x178)](0x3)+_0x393362(0x19b)+_0x17fa10[_0x393362(0x184)]['toFixed'](0x3)+_0x393362(0x171)+_0x17fa10['value']+_0x393362(0x16e)+_0x17fa10[_0x393362(0x170)]+_0x393362(0x1ae);});},'savePreset':function(_0x11535e){const _0x3183b8=_0x3d88,_0x36c1e2=[];document['querySelectorAll']('section#config\x20.items\x20.item')[_0x3183b8(0x1ac)](_0x31aa87=>_0x36c1e2[_0x3183b8(0x18f)]({'name':_0x31aa87[_0x3183b8(0x173)](_0x3183b8(0x1a6)),'value':_0x31aa87[_0x3183b8(0x173)](_0x3183b8(0x183))}));if(document[_0x3183b8(0x18b)]('.presetName\x20input')['value']===''){_0x11535e[_0x3183b8(0x1b6)][_0x3183b8(0x195)]['display']=_0x3183b8(0x1b9),document[_0x3183b8(0x18b)](_0x3183b8(0x180))['style'][_0x3183b8(0x192)]=_0x3183b8(0x1a4),document[_0x3183b8(0x18b)](_0x3183b8(0x1b8))[_0x3183b8(0x195)][_0x3183b8(0x192)]=_0x3183b8(0x1a4);return;}fetch(_0x3183b8(0x175),{'method':'POST','body':JSON[_0x3183b8(0x198)]({'values':_0x36c1e2,'name':document[_0x3183b8(0x18b)](_0x3183b8(0x17d))[_0x3183b8(0x174)],'stance':document[_0x3183b8(0x18b)](_0x3183b8(0x1a3))[_0x3183b8(0x196)]})}),_0x11535e['parentElement']['style'][_0x3183b8(0x192)]=_0x3183b8(0x1b9),document[_0x3183b8(0x18b)](_0x3183b8(0x180))[_0x3183b8(0x195)][_0x3183b8(0x192)]=_0x3183b8(0x1a4),document[_0x3183b8(0x18b)](_0x3183b8(0x1b8))['style'][_0x3183b8(0x192)]=_0x3183b8(0x1a4);},'showPresets':function(){const _0x1460e5=_0x3d88;listClicked?(document['querySelector'](_0x1460e5(0x18e))[_0x1460e5(0x195)]['display']=_0x1460e5(0x1b9),document[_0x1460e5(0x18b)](_0x1460e5(0x17a))[_0x1460e5(0x195)]['display']=_0x1460e5(0x189)):(listClicked=![],document['querySelector'](_0x1460e5(0x17a))[_0x1460e5(0x195)][_0x1460e5(0x192)]=_0x1460e5(0x1b9),document[_0x1460e5(0x18b)]('section#presets')[_0x1460e5(0x195)][_0x1460e5(0x192)]=_0x1460e5(0x189)),listClicked=!listClicked;},'showPresetName':function(_0x343b64){const _0xdb1e32=_0x3d88;_0x343b64[_0xdb1e32(0x195)][_0xdb1e32(0x192)]=_0xdb1e32(0x1b9),document[_0xdb1e32(0x18b)]('#list')[_0xdb1e32(0x195)][_0xdb1e32(0x192)]=_0xdb1e32(0x1b9),document[_0xdb1e32(0x18b)]('.presetName')[_0xdb1e32(0x195)][_0xdb1e32(0x192)]=_0xdb1e32(0x1a4);},'changeItem':function({target:_0x4a0c4b},_0x5a86bd){const _0x13644c=_0x3d88;_0x5a86bd['parentElement'][_0x13644c(0x18b)]('h6')[_0x13644c(0x181)]=_0x4a0c4b['value'];},'loadPresets':function({presets:_0xa510b}){const _0x35a648=_0x3d88;document['querySelector'](_0x35a648(0x1ad))[_0x35a648(0x1a2)]='',_0xa510b[_0x35a648(0x1ac)](_0x562ca0=>{const _0x40e594=_0x35a648;document[_0x40e594(0x18b)]('section#presets\x20.items')[_0x40e594(0x1a2)]+=_0x40e594(0x190)+_0x562ca0[_0x40e594(0x193)]+_0x40e594(0x197)+_0x562ca0[_0x40e594(0x193)]+_0x40e594(0x1ab)+_0x562ca0[_0x40e594(0x1a5)]+_0x40e594(0x1b3)+_0x562ca0['name']+_0x40e594(0x17b);});},'presetChecked':function(_0x3085f5,_0x420a00){const _0x468891=_0x3d88,_0x7289d2=document[_0x468891(0x1aa)](_0x468891(0x1b7));return _0x7289d2[_0x468891(0x1ac)](_0x10e8cc=>_0x10e8cc[_0x468891(0x196)]=![]),_0x3085f5[_0x468891(0x196)]=!![],_0x3085f5[_0x468891(0x196)];},'removePreset':function(){const _0x1b9b2b=_0x3d88,_0x103ab1=document['querySelector']('section#presets\x20input[type=\x22checkbox\x22]:checked');fetch(_0x1b9b2b(0x19f),{'method':_0x1b9b2b(0x18a),'body':JSON['stringify']({'name':_0x103ab1[_0x1b9b2b(0x1b6)][_0x1b9b2b(0x173)](_0x1b9b2b(0x1a6))})}),_0x103ab1[_0x1b9b2b(0x1b6)]['remove']();},'setPreset':function(){const _0x29d26b=_0x3d88,_0x3cff78=document[_0x29d26b(0x18b)](_0x29d26b(0x186));if(!_0x3cff78)return;fetch('http://stancetuning/SetPreset',{'method':_0x29d26b(0x18a),'body':JSON[_0x29d26b(0x198)]({'name':_0x3cff78[_0x29d26b(0x1b6)]['getAttribute'](_0x29d26b(0x1a6))})}),app[_0x29d26b(0x18c)]();}};function _0x1fbe(){const _0x2b11f1=['\x22\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20step=\x22','16630695iTDfHV','step','\x22\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20value=\x22','144095NLNxEK','getAttribute','value','http://stancetuning/SavePreset','http://stancetuning/Save','onmouseup','toFixed','http://stancetuning/Close','section#config','\x27)\x22>\x0a\x20\x20\x20\x20\x20\x20\x20\x20</div>\x0a\x20\x20\x20\x20\x20\x20','addEventListener','.presetName\x20input','876016yIkhUe','onkeydown','#list','textContent','#config\x20.items','data-value','max','3042200klFDdT','section#presets\x20input[type=\x22checkbox\x22]:checked','body','which','block','POST','querySelector','close','6475693gzBzZa','section#presets','push','\x0a\x20\x20\x20\x20\x20\x20\x20\x20<div\x20class=\x22item\x22\x20data-name=\x22','loadPresets','display','name','message','style','checked','\x22>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<div\x20class=\x22text\x22>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<p>','stringify','3RnxMLz','1405468BAgvJn','\x22\x20\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20max=\x22','keyup','</h3>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<h6>','\x22\x20data-value=\x22','http://stancetuning/RemovePreset','section#config\x20.items\x20.item','loadItems','innerHTML','.stance\x20input','flex','car','data-name','205182NiEfth','6FmGTAW','action','querySelectorAll','</p>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<p>ESSE\x20PRESET\x20FOI\x20SALVO\x20EM:\x20<strong>','forEach','section#presets\x20.items','\x22\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20>\x0a\x20\x20\x20\x20\x20\x20\x20\x20</div>\x0a\x20\x20\x20\x20\x20\x20','\x22>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<div\x20class=\x22title\x22>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<h3>','open','min','http://stancetuning/Cam','</strong></p>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20</div>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<input\x20type=\x22checkbox\x22\x20onclick=\x22app.presetChecked(this,\x20\x27','input','http://stancetuning/PreSave','parentElement','section#presets\x20input[type=\x22checkbox\x22]','.savePreset','none','</h6>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20</div>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<input\x20\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20type=\x22range\x22\x20\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20oninput=\x22app.changeItem(event,\x20this)\x22\x20\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20min=\x22'];_0x1fbe=function(){return _0x2b11f1;};return _0x1fbe();}window[_0x202666(0x17c)](_0x202666(0x19c),({key:_0x386197})=>{const _0x38489e=_0x202666;if(_0x386197==='Escape')app[_0x38489e(0x18c)]();}),window[_0x202666(0x17c)](_0x202666(0x194),({data:_0x79473c})=>{const _0x7f8e3c=_0x202666;if(_0x79473c[_0x7f8e3c(0x1a9)]===_0x7f8e3c(0x1b0))app[_0x7f8e3c(0x1a1)](_0x79473c)+app['open'](_0x79473c);if(_0x79473c[_0x7f8e3c(0x1a9)]===_0x7f8e3c(0x1a1))app['loadItems'](_0x79473c);if(_0x79473c[_0x7f8e3c(0x1a9)]===_0x7f8e3c(0x191))app[_0x7f8e3c(0x191)](_0x79473c);}),document['onkeyup']=function(_0x3dc0c){const _0x20d46e=_0x202666;_0x3dc0c[_0x20d46e(0x188)]==0x20&&fetch(_0x20d46e(0x1b2));},document[_0x202666(0x17f)]=function(_0x4a2fbf){const _0x5b0124=_0x202666;_0x4a2fbf[_0x5b0124(0x188)]==0x20&&fetch(_0x5b0124(0x1b2),{'method':_0x5b0124(0x18a),'body':JSON['stringify']({'state':!![]})});},document[_0x202666(0x177)]=function(){const _0x3f49ca=_0x202666,_0x581db5=[];document[_0x3f49ca(0x1aa)](_0x3f49ca(0x1a0))[_0x3f49ca(0x1ac)](_0x3ee777=>_0x581db5[_0x3f49ca(0x18f)]({'name':_0x3ee777['getAttribute'](_0x3f49ca(0x1a6)),'value':_0x3ee777[_0x3f49ca(0x18b)]('input')['value']})),fetch(_0x3f49ca(0x1b5),{'method':_0x3f49ca(0x18a),'body':JSON[_0x3f49ca(0x198)]({'values':_0x581db5,'stance':document[_0x3f49ca(0x18b)](_0x3f49ca(0x1a3))[_0x3f49ca(0x196)]})});};