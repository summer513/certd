import { ALL, Body, Controller, Inject, Post, Provide } from '@midwayjs/core';
import { BaseController } from '../../basic/base-controller.js';
import { PlusService } from '../basic/service/plus-service.js';
import { AppKey } from '@certd/pipeline';
import { SysSettingsService } from '../system/service/sys-settings-service.js';
import { SysInstallInfo } from '../system/service/models.js';

export type PreBindUserReq = {
  userId: number;
};

/**
 */
@Provide()
@Controller('/api/sys/account')
export class BasicController extends BaseController {
  @Inject()
  plusService: PlusService;

  @Inject()
  sysSettingsService: SysSettingsService;

  @Post('/preBindUser', { summary: 'sys:settings:edit' })
  public async preBindUser(@Body(ALL) body: PreBindUserReq) {
    const installInfo: SysInstallInfo = await this.sysSettingsService.getSetting(SysInstallInfo);
    // 设置缓存内容
    await this.plusService.request({
      url: '/activation/subject/preBind',
      data: {
        userId: body.userId,
        appKey: AppKey,
        subjectId: installInfo.siteId,
      },
    });

    return this.ok({});
  }
}
