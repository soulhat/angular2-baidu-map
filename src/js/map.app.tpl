<div class="valign-wrapper light-blue">
    <div class="valign center" style="width: 100%;">
        <h1>angular2-baidu-map</h1>
        <a class="btn-floating waves-effect waves-light btn-large blue-grey darken-4 tooltip" href="https://github.com/leftstick/angular2-baidu-map" title="View On Github">
            <i class="icon-github" style="font-size: 40px; line-height: 58.5px;"></i>
        </a>
        <p>Baidu Map component for Angular2</p>
    </div>
</div>

<div class="container">

    <h4>Demonstration</h4>
    <br/>
    <baidu-map ak="5XO4WhIyUWAkSu9dvBq21mgc" [options]="opts" [offline]="offlineOpts" (onMapLoaded)="loadMap($event)" (onMarkerClicked)="clickMarker($event)"></baidu-map>
    <br/>
    <div class="center-align">
        <a class="btn-floating blue" (click)="updateCoordinate($event)"><i class="icon-globe"></i></a>
        <a class="btn-floating blue" (click)="updateMarker($event)"><i class="icon-location"></i></a>
        <a class="btn-floating blue" (click)="updateZoom($event)"><i class="icon-search"></i></a>
    </div>
    <br/>

    <h4>Install via npm</h4>
    <br/>

    <p>You can install and manage <code class="snippet">angular2-baidu-map</code> via <a href="https://www.npmjs.com/">npm</a>:</p>
    <pre class="line-numbers"><code class="language-bash"><!--
        -->npm install angular2-baidu-map --save<!--
    --></code></pre>
    <br/>

    <h4>Import</h4>
    <br/>

    <h5 class="title">ES2015</h5>

    <pre class="line-numbers"><code class="language-javascript"><!--
    -->import {BaiduMap} from 'angular2-baidu-map';<!--
    --></code></pre>
    <br/>

    <h4>Usage</h4>
    <br/>

    <pre class="line-numbers"><code class="language-javascript"><!--
    -->import {Component, OnInit} from '@angular/core';
import {BaiduMap, OfflineOptions, ControlAnchor} from 'angular2-baidu-map';

@Component({
    selector: 'map-presentation',
    template: `
        &lt;h1&gt;Test Baidu-Map&lt;h1&gt;
        &lt;baidu-map ak="put your ak here" [options]="opts" [offline]="offlineOpts" (onMapLoaded)="loadMap($event)" (onMarkerClicked)="clickMarker($event)"&gt;&lt;/baidu-map&gt;
    `,
    styles: [`
        baidu-map{
            width: 500px;
            height: 400px;
            display: block;
        }
    `],
    directives: [BaiduMap]
})
export class MainApp implements OnInit {

    opts: any;
    offlineOpts: OfflineOptions;

    ngOnInit() {
        this.opts = {
            center: {
                longitude: 121.506191,
                latitude: 31.245554
            },
            zoom: 17,
            markers: [{
                longitude: 121.506191,
                latitude: 31.245554,
                title: 'Where',
                content: 'Put description here'
            }],
            geolocationCtrl: {
                anchor: ControlAnchor.BMAP_ANCHOR_BOTTOM_RIGHT
            }
        };

        this.offlineOpts = {
            retryInterval: 5000,
            txt: 'NO-NETWORK'
        };
    }

    loadMap(map: any) {
        console.log('map instance here', map);
    }

    clickMarker(marker: any){
        console.log('The clicked marker is', marker);
    }
}<!--
    --></code></pre>
    <br/>
    <blockquote>
        Be aware that <code>width</code>, <code>height</code> must be specified to <code>baidu-map</code> component. Otherwise, the map cannot be displayed.
    </blockquote>

    <h5>Update map dynamically</h5>
    <br/>

    <pre class="line-numbers"><code class="language-javascript"><!--
    -->@Component({
    selector: 'map-presentation',
    template: `
        &lt;baidu-map ak="put your ak here" [options]="opts"&gt;&lt;/baidu-map&gt;
        &lt;button (click)="updateCoordinate($event)"&gt;Update Coordinate&lt;button&gt;
    `,
    styles: [...],
    directives: [BaiduMap]
})
export class MainApp implements OnInit {

    opts: any;

    ngOnInit() {
        ...
    }

    /**
     * the map will be pointed to
     * new coordinate once click
     * the button
     */
    updateCoordinate(e: MouseEvent){
        this.opts = {
            center: {
                longitude: 121.500885,
                latitude: 31.190032
            }
        };
    }
}<!--
    --></code></pre>
    <br/>

    <h4>API</h4>
    <br/>

    <h5>attributes</h5>
    <br/>

    <table class="bordered striped hoverable">
        <thead>
          <tr>
              <th>Param</th>
              <th>Type</th>
              <th>Details</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>ak</td>
            <td><span class="string-type">string</span></td>
            <td>ak that should be applied in <a href="http://lbsyun.baidu.com/apiconsole/key" target="_blank">Baidu Developer</a></td>
          </tr>
          <tr>
              <td>options</td>
              <td><span class="object-type">MapOptions</span></td>
              <td>options used to draw the map</td>
          </tr>
          <tr>
              <td>offline</td>
              <td><span class="object-type">OfflineOptions</span></td>
              <td>options applied while no-network available</td>
          </tr>
          <tr>
              <td>onMapLoaded</td>
              <td><span class="expression-type">Expression</span></td>
              <td>Expression to evaluate upon callback, (Event object is available as the map instance)</td>
          </tr>
          <tr>
              <td>onMarkerClicked</td>
              <td><span class="expression-type">Expression</span></td>
              <td>Expression to evaluate upon callback, (Event object is available as the marker instance)</td>
          </tr>
        </tbody>
    </table>

    <h5>MapOptions</h5>
    <br/>

    <table class="bordered striped hoverable">
        <thead>
          <tr>
              <th>Param</th>
              <th class="hide-on-small-only">Type</th>
              <th class="hide-on-small-only">Required</th>
              <th >Description</th>
              <th class="hide-on-small-only">Example</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>center</td>
            <td class="hide-on-small-only"><span class="object-type">Object</span></td>
            <td class="hide-on-small-only">Yes</td>
            <td>the point in geographical coordinates</td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript"><!--
-->{
    longitude: 121.506191,
    latitude: 31.245554
}<!--
            --></code></pre></td>
          </tr>

          <tr>
            <td>zoom</td>
            <td class="hide-on-small-only"><span class="number-type">Number</span></td>
            <td class="hide-on-small-only">No</td>
            <td>zoom level which will be displayed on the map. default is <code>10</code></td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">15</code></pre></td>
          </tr>

          <tr>
            <td>navCtrl</td>
            <td class="hide-on-small-only"><span class="boolean-type">Boolean</span></td>
            <td class="hide-on-small-only">No</td>
            <td>whether to add a NavigationControl to the map. default is <code>true</code></td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">false</code></pre></td>
          </tr>

          <tr>
            <td>scaleCtrl</td>
            <td class="hide-on-small-only"><span class="boolean-type">Boolean</span></td>
            <td class="hide-on-small-only">No</td>
            <td>whether to add a ScaleControl to the map. default is <code>true</code></td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">false</code></pre></td>
          </tr>

          <tr>
            <td>overviewCtrl</td>
            <td class="hide-on-small-only"><span class="boolean-type">Boolean</span></td>
            <td class="hide-on-small-only">No</td>
            <td>whether to add a OverviewMapControl to the map. default is <code>true</code></td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">false</code></pre></td>
          </tr>

          <tr>
            <td>enableScrollWheelZoom</td>
            <td class="hide-on-small-only"><span class="boolean-type">Boolean</span></td>
            <td class="hide-on-small-only">No</td>
            <td>whether to enableScrollWheelZoom to the map. default is <code>true</code></td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">false</code></pre></td>
          </tr>

          <tr>
            <td>geolocationCtrl</td>
            <td class="hide-on-small-only"><span class="object-type">GeolocationControlOptions || Boolean </span></td>
            <td class="hide-on-small-only">No</td>
            <td>Add GeolocationControl to the map</td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript"><!--
-->{
    anchor: ControlAnchor.BMAP_ANCHOR_BOTTOM_RIGHT,
    offset: { width: 100, height: 200},
    showAddressBar: true,
    enableAutoLocation: true,
    locationIcon: {
        url: 'http://xxx/url.png',
        size: {
            width: 100,
            height: 100
        }
    }
}<!--
              --></code></pre></td>
          </tr>

          <tr>
            <td>markers</td>
            <td class="hide-on-small-only"><span class="array-type">Array</span></td>
            <td class="hide-on-small-only">No</td>
            <td>marker will be displayed on the map. default is <code>empty</code></td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript"><!--
-->[{
    longitude: 121.506191,
    latitude: 31.245554,
    title: 'Where',
    content: 'Put description here'
}]<!--
              --></code></pre>
            </td>
          </tr>
        </tbody>
    </table>


    <h5>OfflineOptions</h5>
    <br/>

    <table class="bordered striped hoverable">
        <thead>
          <tr>
              <th>Param</th>
              <th class="hide-on-small-only">Type</th>
              <th class="hide-on-small-only">Required</th>
              <th >Description</th>
              <th class="hide-on-small-only">Example</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>retryInterval</td>
            <td class="hide-on-small-only"><span class="number-type">Number</span></td>
            <td class="hide-on-small-only">No</td>
            <td>interval used to retry if network is available. 30000ms by default</td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">5000</code></pre></td>
          </tr>

          <tr>
            <td>txt</td>
            <td class="hide-on-small-only"><span class="string-type">String</span></td>
            <td class="hide-on-small-only">No</td>
            <td>text to be displayed while no-network available. "OFFLINE" by default</td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">NO-NETWORK</code></pre></td>
          </tr>
        </tbody>
    </table>

    <h5>GeolocationControlOptions</h5>
    <br/>

    <table class="bordered striped hoverable">
        <thead>
          <tr>
              <th>Param</th>
              <th class="hide-on-small-only">Type</th>
              <th class="hide-on-small-only">Required</th>
              <th >Description</th>
              <th class="hide-on-small-only">Example</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>anchor</td>
            <td class="hide-on-small-only"><span class="enum-type">ControlAnchor</span></td>
            <td class="hide-on-small-only">No</td>
            <td>Where to place the GeoLocaltionControl</td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">ControlAnchor.BMAP_ANCHOR_TOP_LEFT</code></pre></td>
          </tr>

          <tr>
            <td>offset</td>
            <td class="hide-on-small-only"><span class="object-type">Size</span></td>
            <td class="hide-on-small-only">No</td>
            <td>Horizontal offset of the GeoLocaltionControl</td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">{ width: 100, height: 100}</code></pre></td>
          </tr>

          <tr>
            <td>showAddressBar</td>
            <td class="hide-on-small-only"><span class="boolean-type">Boolean</span></td>
            <td class="hide-on-small-only">No</td>
            <td>Whether to display the control panel</td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">true</code></pre></td>
          </tr>

          <tr>
            <td>enableAutoLocation</td>
            <td class="hide-on-small-only"><span class="boolean-type">Boolean</span></td>
            <td class="hide-on-small-only">No</td>
            <td>Whether to positioning while map added</td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">true</code></pre></td>
          </tr>

          <tr>
            <td>locationIcon</td>
            <td class="hide-on-small-only"><span class="object-type">Icon</span></td>
            <td class="hide-on-small-only">No</td>
            <td>Customize the icon</td>
            <td class="hide-on-small-only" style="padding: 0;"><pre style="margin: 0;padding-top: 5px; padding-bottom: 5px;"><code class="language-javascript">{ url: 'http://wwww/xx.png', size: { width: 50, height: 50} }</code></pre></td>
          </tr>
        </tbody>
    </table>

</div>

<footer class="footer">
        <p>&copy; 2016 Licensed under <a href="https://github.com/leftstick/angular2-baidu-map/blob/master/LICENSE" target="_blank">MIT license</a>. by <a href="http://leftstick.gitcafe.io/" target="_blank">Howard.Zuo</a>.</p>
</footer>
