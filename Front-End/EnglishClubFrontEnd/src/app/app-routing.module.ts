import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { ClientNavBarComponent } from './client-nav-bar/client-nav-bar.component';
import { ClientVideoComponent } from './client-video/client-video.component';
import { ClientHomeComponent } from './client-home/client-home.component';
import { ClientNewsComponent } from './client-news/client-news.component';
import { ClientTipComponent } from './client-tip/client-tip.component';
import { ClientEMaterialComponent } from './client-e-material/client-e-material.component';
import { AdminNavBarComponent } from './admin-nav-bar/admin-nav-bar.component';
import { AdminVideoComponent } from './admin-video/admin-video.component';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { AdminEMaterialComponent } from './admin-e-material/admin-e-material.component';
import { AdminTipComponent } from './admin-tip/admin-tip.component';
import { AdminNewsComponent } from './admin-news/admin-news.component';
import { AdminEMaterialTypeComponent } from './admin-e-material-type/admin-e-material-type.component';
import { AdminTipTypeComponent } from './admin-tip-type/admin-tip-type.component';
import { AdminNewstypeComponent } from './admin-newstype/admin-newstype.component';
import { AdminVideoTypeComponent } from './admin-video-type/admin-video-type.component';

const routes: Routes = [

  {
    path: 'admin/login',
    component: LoginComponent
  },
  {
    path: 'manage',
    component: AdminNavBarComponent,
    children: [
      {
        path: 'video',
        component: AdminVideoComponent
      },
      {
        path: 'ematerial',
        component: AdminEMaterialComponent
      },
      {
        path: 'tip',
        component: AdminTipComponent
      },
      {
        path: 'news',
        component: AdminNewsComponent
      },
      {
        path: 'home',
        component: AdminHomeComponent
      },

      {
        path: 'ematerialtypes',
        component: AdminEMaterialTypeComponent
      },

      {
        path: 'newstypes',
        component: AdminNewstypeComponent
      },

      {
        path: 'tiptypes',
        component: AdminTipTypeComponent
      },

      {
        path: 'videotypes',
        component: AdminVideoTypeComponent
      },
    ]

  },
  {
    path: 'client',
    component: ClientNavBarComponent,
    children: [
      {
        path: 'video',
        component: ClientVideoComponent
      },
      {
        path: 'ematerial',
        component: ClientEMaterialComponent
      },
      {
        path: 'tip',
        component: ClientTipComponent
      },
      {
        path: 'news',
        component: ClientNewsComponent
      },
      {
        path: 'home',
        component: ClientHomeComponent
      },

    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
