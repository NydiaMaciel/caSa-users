(()=>{
    var a=window._flutter;
    a||(a=window._flutter={});
    a.loader=null;
    (function(){
        "use strict";
        let l=p(u());
        
        function u(){
            let n=document.querySelector("base");return n&&n.getAttribute("href")||""
        }
            
        function p(n){
            return n==""||n.endsWith("/")?n:`${n}/`
        }
        async function d(n,e,r){
            if(e<0)return n;
            
            let t,i=new Promise((o,s)=>{
                t=setTimeout(()=>{
                    s(new Error(`${r} took more than ${e}ms to resolve. Moving on.`,{
                        cause:d})
                    )},e
                )
            });
            return Promise.race([n,i]).finally(()=>{clearTimeout(t)});
        }
        
        class y{
            constructor(e,r="flutter-js"){let t=e||[/\.js$/];
            
            window.trustedTypes&&(this.policy=trustedTypes.createPolicy(r,{
                createScriptURL:function(i){
                    let o=new URL(i,window.location),s=o.pathname.split("/").pop();
                    if(t.some(w=>w.test(s))) return o.toString();
                    console.error("URL rejected by TrustedTypes policy",r,":",i,"(download prevented)");
                }
            }));
    }
}

class g{
    setTrustedTypesPolicy(e){this._ttPolicy=e}loadServiceWorker(e){
        if(e==null)return console.debug("Null serviceWorker configuration. Skipping."),Promise.resolve();
        if(!("serviceWorker"in navigator)){
            let c="Service Worker API unavailable.";
            return window.isSecureContext||(c+=`The current context is NOT secure.`,c+=`Read more: https://developer.mozilla.org/en-US/docs/Web/Security/Secure_Contexts`),Promise.reject(new Error(c))}let{serviceWorkerVersion:r,serviceWorkerUrl:t=`${l}flutter_service_worker.js?v=${r}`,timeoutMillis:i=4e3}=e,o=t;this._ttPolicy!=null&&(o=this._ttPolicy.createScriptURL(o));
            let s=navigator.serviceWorker.register(o).then(c=>this._getNewServiceWorker(c,r)).then(this._waitForServiceWorkerActivation);return d(s,i,"prepareServiceWorker")}async _getNewServiceWorker(e,r){if(!e.active&&(e.installing||e.waiting))return console.debug("Installing/Activating first service worker."),e.installing||e.waiting;
            if(e.active.scriptURL.endsWith(r))return console.debug("Loading from existing service worker."),e.active;
            {let t=await e.update();
                return console.debug("Updating service worker."),t.installing||t.waiting||t.active}}async _waitForServiceWorkerActivation(e){if(!e||e.state=="activated")if(e){console.debug("Service worker already active.");return}else throw new Error("Cannot activate a null service worker!");
            return new Promise((r,t)=>{e.addEventListener("statechange",()=>{e.state=="activated"&&(console.debug("Activated new service worker."),r())})})}}class f{constructor(){this._scriptLoaded=!1}setTrustedTypesPolicy(e){this._ttPolicy=e}async loadEntrypoint(e){let{entrypointUrl:r=`${l}main.dart.js`,onEntrypointLoaded:t,nonce:i}=e||{};
            return this._loadEntrypoint(r,t,i)}didCreateEngineInitializer(e){typeof this._didCreateEngineInitializerResolve=="function"&&(this._didCreateEngineInitializerResolve(e),this._didCreateEngineInitializerResolve=null,delete a.loader.didCreateEngineInitializer),typeof this._onEntrypointLoaded=="function"&&this._onEntrypointLoaded(e)}_loadEntrypoint(e,r,t){let i=typeof r=="function";
            if(!this._scriptLoaded){this._scriptLoaded=!0;
                let o=this._createScriptTag(e,t);if(i)console.debug("Injecting <script> tag. Using callback."),this._onEntrypointLoaded=r,document.body.append(o);
            else return new Promise((s,c)=>{console.debug("Injecting <script> tag. Using Promises. Use the callback approach instead!"),this._didCreateEngineInitializerResolve=s,o.addEventListener("error",c),document.body.append(o)})}}_createScriptTag(e,r){let t=document.createElement("script");
            t.type="application/javascript",r&&(t.nonce=r);
            let i=e;
            return this._ttPolicy!=null&&(i=this._ttPolicy.createScriptURL(e)),t.src=i,t}}class v{async loadEntrypoint(e){let{serviceWorker:r,...t}=e||{},i=new y,o=new g;
            o.setTrustedTypesPolicy(i.policy),await o.loadServiceWorker(r).catch(c=>{console.warn("Exception while loading service worker:",c)});
            let s=new f;
            return s.setTrustedTypesPolicy(i.policy),this.didCreateEngineInitializer=s.didCreateEngineInitializer.bind(s),s.loadEntrypoint(t)}}a.loader=new v})();
        })();
//# sourceMappingURL=flutter.js.map
