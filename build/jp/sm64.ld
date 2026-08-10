OUTPUT_ARCH (mips)
SECTIONS
{
    __romPos = 0;
    _bootSegmentStart = ADDR(.boot); _bootSegmentRomStart = __romPos; .boot (0x04000000) : AT(__romPos)
    {
        build/jp/asm/rom_header.o(.text);
        build/jp/asm/boot.o(.text);
        build/jp/asm/ipl3_font.o(.text);
    }
    _bootSegmentEnd = ADDR(.boot) + SIZEOF(.boot); _bootSegmentRomEnd = __romPos + SIZEOF(.boot); __romPos += SIZEOF(.boot);
    . = 0x80000400;
    _zbufferSegmentNoloadStart = ADDR(.zbuffer.noload); .zbuffer.noload (NOLOAD) : {
        build/jp/src/buffers/zbuffer.o(.bss*);
    }
    . = 0x8005C000;
    _buffersSegmentNoloadStart = ADDR(.buffers.noload); .buffers.noload (NOLOAD) :
    {
        build/jp/src/buffers/buffers.o(.bss*);
        build/jp/src/audio/globals_start.o(.bss*);
        build/jp/src/audio/synthesis.o(.bss*);
        build/jp/src/audio/heap.o(.bss*);
        build/jp/src/audio/load.o(.bss*);
        build/jp/src/audio/data.o(.bss*);
        . = ALIGN(0x1000);
        build/jp/src/buffers/gfx_output_buffer.o(.bss*);
    }
    _buffersSegmentNoloadEnd = ADDR(.buffers.noload) + SIZEOF(.buffers.noload);
    _mainSegmentStart = ADDR(.main); _mainSegmentRomStart = __romPos; .main () : AT(__romPos)
        SUBALIGN(16)
    {
        build/jp/asm/entry.o(.text);
        build/jp/src/game/crash_screen.o(.text);
        build/jp/src/game/main.o(.text);
        build/jp/src/game/game_init.o(.text);
        build/jp/src/game/sound_init.o(.text);
        build/jp/src/game/level_update.o(.text);
        build/jp/src/game/interaction.o(.text);
        build/jp/src/game/mario.o(.text);
        build/jp/src/game/mario_step.o(.text);
        build/jp/src/game/mario_actions_cutscene.o(.text);
        build/jp/src/game/mario_actions_automatic.o(.text);
        build/jp/src/game/mario_actions_stationary.o(.text);
        build/jp/src/game/mario_actions_moving.o(.text);
        build/jp/src/game/mario_actions_airborne.o(.text);
        build/jp/src/game/mario_actions_submerged.o(.text);
        build/jp/src/game/mario_actions_object.o(.text);
        build/jp/src/game/level_geo.o(.text);
        build/jp/src/game/mario_misc.o(.text);
        build/jp/src/game/memory.o(.text);
        build/jp/src/game/save_file.o(.text);
        build/jp/src/game/area.o(.text);
        build/jp/src/game/rendering_graph_node.o(.text);
        build/jp/src/game/profiler.o(.text);
        build/jp/asm/decompress.o(.text);
        build/jp/src/game/camera.o(.text);
        build/jp/src/game/debug_course.o(.text);
        build/jp/src/game/object_list_processor.o(.text);
        build/jp/src/game/object_helpers.o(.text);
        build/jp/src/game/behavior_actions.o(.text);
        build/jp/src/game/platform_displacement.o(.text);
        build/jp/src/game/object_collision.o(.text);
        build/jp/src/game/spawn_object.o(.text);
        build/jp/src/game/spawn_sound.o(.text);
        build/jp/src/game/debug.o(.text);
        build/jp/src/game/screen_transition.o(.text);
        build/jp/src/game/shadow.o(.text);
        build/jp/src/game/skybox.o(.text);
        build/jp/src/game/moving_texture.o(.text);
        build/jp/src/game/geo_misc.o(.text);
        build/jp/src/game/paintings.o(.text);
        build/jp/src/game/print.o(.text);
        build/jp/src/game/ingame_menu.o(.text);
        build/jp/src/game/envfx_snow.o(.text);
        build/jp/src/game/envfx_bubbles.o(.text);
        build/jp/src/game/macro_special_objects.o(.text);
        build/jp/src/game/hud.o(.text);
        build/jp/src/game/obj_behaviors.o(.text);
        build/jp/src/game/obj_behaviors_2.o(.text);
        build/jp/src/audio/synthesis.o(.text);
        build/jp/src/audio/heap.o(.text);
        build/jp/src/audio/load.o(.text);
        build/jp/src/audio/playback.o(.text);
        build/jp/src/audio/effects.o(.text);
        build/jp/src/audio/seqplayer.o(.text);
        build/jp/src/audio/external.o(.text);
        build/jp/src/audio/port_eu.o(.text);
        build/jp/src/game*.o(.text);
        build/jp/src/audio*.o(.text);
        build/jp/libultra.a:parameters.o(.text);
        build/jp/libultra.a:osSetTime.o(.text);
        build/jp/libultra.a:osMapTLB.o(.text);
        build/jp/libultra.a:osUnmapTLBAll.o(.text);
        build/jp/libultra.a:sprintf.o(.text);
        build/jp/libultra.a:osCreateMesgQueue.o(.text);
        build/jp/libultra.a:osSetEventMesg.o(.text);
        build/jp/libultra.a:osViSetEvent.o(.text);
        build/jp/libultra.a:osCreateThread.o(.text);
        build/jp/libultra.a:osRecvMesg.o(.text);
        build/jp/libultra.a:osSpTaskLoadGo.o(.text);
        build/jp/libultra.a:osSpTaskYield.o(.text);
        build/jp/libultra.a:osSendMesg.o(.text);
        build/jp/libultra.a:osSpTaskYielded.o(.text);
        build/jp/libultra.a:osStartThread.o(.text);
        build/jp/libultra.a:osWritebackDCacheAll.o(.text);
        build/jp/libultra.a:osCreateViManager.o(.text);
        build/jp/libultra.a:osViSetMode.o(.text);
        build/jp/libultra.a:osViBlack.o(.text);
        build/jp/libultra.a:osViSetSpecialFeatures.o(.text);
        build/jp/libultra.a:osCreatePiManager.o(.text);
        build/jp/libultra.a:osSetThreadPri.o(.text);
        build/jp/libultra.a:osInitialize.o(.text);
        build/jp/libultra.a:osViSwapBuffer.o(.text);
        build/jp/libultra.a:sqrtf.o(.text);
        build/jp/libultra.a:osContStartReadData.o(.text);
        build/jp/libultra.a:osContInit.o(.text);
        build/jp/libultra.a:osEepromProbe.o(.text);
        build/jp/libultra.a:llmuldiv.o(.text);
        build/jp/libultra.a:llmuldiv_gcc.o(.text);
        build/jp/libultra.a:osInvalDCache.o(.text);
        build/jp/libultra.a:osPiStartDma.o(.text);
        build/jp/libultra.a:bzero.o(.text);
        build/jp/libultra.a:osInvalICache.o(.text);
        build/jp/libultra.a:osEepromLongRead.o(.text);
        build/jp/libultra.a:osEepromLongWrite.o(.text);
        build/jp/libultra.a:bcopy.o(.text);
        build/jp/libultra.a:guOrthoF.o(.text);
        build/jp/libultra.a:guPerspectiveF.o(.text);
        build/jp/libultra.a:osGetTime.o(.text);
        build/jp/libultra.a:llconv.o(.text);
        build/jp/libultra.a:cosf.o(.text);
        build/jp/libultra.a:sinf.o(.text);
        build/jp/libultra.a:guTranslateF.o(.text);
        build/jp/libultra.a:guRotateF.o(.text);
        build/jp/libultra.a:guScaleF.o(.text);
        build/jp/libultra.a:osAiSetFrequency.o(.text);
        build/jp/libultra.a:alBnkfNew.o(.text);
        build/jp/libultra.a:osWritebackDCache.o(.text);
        build/jp/libultra.a:osAiGetLength.o(.text);
        build/jp/libultra.a:osAiSetNextBuffer.o(.text);
        build/jp/libultra.a:osTimer.o(.text);
        build/jp/libultra.a:_Printf.o(.text);
        build/jp/libultra.a:string.o(.text);
        build/jp/libultra.a:__osDequeueThread.o(.text);
        build/jp/libultra.a:__osDisableInt.o(.text);
        build/jp/libultra.a:__osRestoreInt.o(.text);
        build/jp/libultra.a:__osViInit.o(.text);
        build/jp/libultra.a:__osExceptionPreamble.o(.text);
        build/jp/libultra.a:osVirtualToPhysical.o(.text);
        build/jp/libultra.a:__osSpSetStatus.o(.text);
        build/jp/libultra.a:__osSpSetPc.o(.text);
        build/jp/libultra.a:__osSpRawStartDma.o(.text);
        build/jp/libultra.a:__osSpDeviceBusy.o(.text);
        build/jp/libultra.a:__osSpGetStatus.o(.text);
        build/jp/libultra.a:osGetThreadPri.o(.text);
        build/jp/libultra.a:__osViGetCurrentContext.o(.text);
        build/jp/libultra.a:__osViSwapContext.o(.text);
        build/jp/libultra.a:osGetCount.o(.text);
        build/jp/libultra.a:__osPiCreateAccessQueue.o(.text);
        build/jp/libultra.a:osPiRawStartDma.o(.text);
        build/jp/libultra.a:__osDevMgrMain.o(.text);
        build/jp/libultra.a:__osSetSR.o(.text);
        build/jp/libultra.a:__osGetSR.o(.text);
        build/jp/libultra.a:__osSetFpcCsr.o(.text);
        build/jp/libultra.a:__osSiRawReadIo.o(.text);
        build/jp/libultra.a:__osSiRawWriteIo.o(.text);
        build/jp/libultra.a:osMapTLBRdb.o(.text);
        build/jp/libultra.a:osPiRawReadIo.o(.text);
        . += 0x40;
        build/jp/libultra.a:__osSiCreateAccessQueue.o(.text);
        build/jp/libultra.a:__osSiRawStartDma.o(.text);
        build/jp/libultra.a:osSetTimer.o(.text);
        build/jp/libultra.a:osEepromWrite.o(.text);
        build/jp/libultra.a:osJamMesg.o(.text);
        build/jp/libultra.a:osPiGetCmdQueue.o(.text);
        build/jp/libultra.a:osEepromRead.o(.text);
        build/jp/libultra.a:guMtxF2L.o(.text);
        build/jp/libultra.a:guMtxIdentF.o(.text);
        build/jp/libultra.a:guNormalize.o(.text);
        build/jp/libultra.a:__osAiDeviceBusy.o(.text);
        build/jp/libultra.a:__osSetCompare.o(.text);
        build/jp/libultra.a:_Litob.o(.text);
        build/jp/libultra.a:_Ldtob.o(.text);
        build/jp/libultra.a:kdebugserver.o(.text);
        build/jp/libultra.a:__osSyncPutChars.o(.text);
        build/jp/libultra.a:osSetIntMask.o(.text);
        build/jp/libultra.a:osDestroyThread.o(.text);
        build/jp/libultra.a:__osProbeTLB.o(.text);
        build/jp/libultra.a:__osSiDeviceBusy.o(.text);
        build/jp/libultra.a:ldiv.o(.text);
        build/jp/libultra.a:__osGetCause.o(.text);
        build/jp/libultra.a:__osAtomicDec.o(.text);
        build/jp/libultra.a:guLookAtRef.o(.text);
        build/jp/lib/rsp.o(.text);
        build/jp/src/game/crash_screen.o(.data*);
        build/jp/src/game/main.o(.data*);
        build/jp/src/game/game_init.o(.data*);
        build/jp/src/game/sound_init.o(.data*);
        build/jp/src/game/level_update.o(.data*);
        build/jp/src/game/interaction.o(.data*);
        build/jp/src/game/mario.o(.data*);
        build/jp/src/game/mario_step.o(.data*);
        build/jp/src/game/mario_actions_cutscene.o(.data*);
        build/jp/src/game/mario_actions_moving.o(.data*);
        build/jp/src/game/mario_actions_submerged.o(.data*);
        build/jp/src/game/mario_actions_object.o(.data*);
        build/jp/src/game/mario_misc.o(.data*);
        build/jp/src/game/memory.o(.data*);
        build/jp/src/game/save_file.o(.data*);
        build/jp/src/game/area.o(.data*);
        build/jp/src/game/rendering_graph_node.o(.data*);
        build/jp/src/game/profiler.o(.data*);
        build/jp/src/game/camera.o(.data*);
        build/jp/src/game/object_list_processor.o(.data*);
        build/jp/src/game/object_helpers.o(.data*);
        build/jp/src/game/behavior_actions.o(.data*);
        build/jp/src/game/platform_displacement.o(.data*);
        build/jp/src/game/spawn_sound.o(.data*);
        build/jp/src/game/debug.o(.data*);
        build/jp/src/game/screen_transition.o(.data*);
        build/jp/src/game/shadow.o(.data*);
        build/jp/src/game/skybox.o(.data*);
        build/jp/src/game/moving_texture.o(.data*);
        build/jp/src/game/geo_misc.o(.data*);
        build/jp/src/game/paintings.o(.data*);
        build/jp/src/game/print.o(.data*);
        build/jp/src/game/ingame_menu.o(.data*);
        build/jp/src/game/envfx_snow.o(.data*);
        build/jp/src/game/envfx_bubbles.o(.data*);
        build/jp/src/game/macro_special_objects.o(.data*);
        build/jp/src/game/hud.o(.data*);
        build/jp/src/game/obj_behaviors.o(.data*);
        build/jp/src/game/obj_behaviors_2.o(.data*);
        build/jp/src/game*.o(.data*);
        build/jp/src/audio/synthesis.o(.data*);
        build/jp/src/audio/heap.o(.data*);
        build/jp/src/audio/load.o(.data*);
        build/jp/src/audio/playback.o(.data*);
        build/jp/src/audio/effects.o(.data*);
        build/jp/src/audio/seqplayer.o(.data*);
        build/jp/src/audio/external.o(.data*);
        build/jp/src/audio/port_eu.o(.data*);
        build/jp/src/audio/data.o(.data*);
        build/jp/libultra.a:osViTable.o(.data*);
        build/jp/libultra.a:osCreateViManager.o(.data*);
        build/jp/libultra.a:osCreatePiManager.o(.data*);
        build/jp/libultra.a:osInitialize.o(.data*);
        build/jp/libultra.a:osContInit.o(.data*);
        build/jp/libultra.a:osAiSetNextBuffer.o(.data*);
        build/jp/libultra.a:osTimer.o(.data*);
        build/jp/libultra.a:_Printf.o(.data*);
        build/jp/libultra.a:__osDequeueThread.o(.data*);
        build/jp/libultra.a:__osViInit.o(.data*);
        build/jp/libultra.a:__osExceptionPreamble.o(.data*);
        build/jp/libultra.a:__osPiCreateAccessQueue.o(.data*);
        build/jp/libultra.a:__osSiCreateAccessQueue.o(.data*);
        build/jp/libultra.a:_Litob.o(.data*);
        build/jp/libultra.a:_Ldtob.o(.data*);
        build/jp/libultra.a:osViData.o(.data*);
        build/jp/libultra.a:kdebugserver.o(.data*);
        build/jp/libultra.a:__osSyncPutChars.o(.data*);
        build/jp/libultra.a:guRotateF.o(.data*);
        build/jp/libultra.a:*.o(.data*);
        build/jp/src/game/crash_screen.o(.rodata*);
        build/jp/src/game/main.o(.rodata*);
        build/jp/src/game/game_init.o(.rodata*);
        build/jp/src/game/sound_init.o(.rodata*);
        build/jp/src/game/rumble_init.o(.rodata*);
        build/jp/src/game/level_update.o(.rodata*);
        build/jp/src/game/interaction.o(.rodata*);
        build/jp/src/game/mario.o(.rodata*);
        build/jp/src/game/mario_step.o(.rodata*);
        build/jp/src/game/mario_actions_cutscene.o(.rodata*);
        build/jp/src/game/mario_actions_automatic.o(.rodata*);
        build/jp/src/game/mario_actions_stationary.o(.rodata*);
        build/jp/src/game/mario_actions_moving.o(.rodata*);
        build/jp/src/game/mario_actions_airborne.o(.rodata*);
        build/jp/src/game/mario_actions_submerged.o(.rodata*);
        build/jp/src/game/mario_actions_object.o(.rodata*);
        build/jp/src/game/mario_misc.o(.rodata*);
        build/jp/src/game/memory.o(.rodata*);
        build/jp/src/game/area.o(.rodata*);
        build/jp/src/game/rendering_graph_node.o(.rodata*);
        build/jp/src/game/camera.o(.rodata*);
        build/jp/src/game/object_list_processor.o(.rodata*);
        build/jp/src/game/object_helpers.o(.rodata*);
        build/jp/src/game/behavior_actions.o(.rodata*);
        build/jp/src/game/object_collision.o(.rodata*);
        build/jp/src/game/spawn_object.o(.rodata*);
        build/jp/libultra.a:__osDisableInt.o(.text);
        build/jp/libultra.a:__osRestoreInt.o(.text);
        build/jp/src/game/spawn_sound.o(.rodata*);
        build/jp/src/game/debug.o(.rodata*);
        build/jp/src/game/screen_transition.o(.rodata*);
        build/jp/src/game/shadow.o(.rodata*);
        build/jp/src/game/skybox.o(.rodata*);
        build/jp/src/game/moving_texture.o(.rodata*);
        build/jp/src/game/geo_misc.o(.rodata*);
        build/jp/src/game/paintings.o(.rodata*);
        build/jp/src/game/print.o(.rodata*);
        build/jp/src/game/ingame_menu.o(.rodata*);
        build/jp/src/game/envfx_snow.o(.rodata*);
        build/jp/src/game/envfx_bubbles.o(.rodata*);
        build/jp/src/game/macro_special_objects.o(.rodata*);
        build/jp/src/game/hud.o(.rodata*);
        build/jp/src/game/obj_behaviors.o(.rodata*);
        build/jp/src/game/obj_behaviors_2.o(.rodata*);
        build/jp/src/game*.o(.rodata*);
        build/jp/src/audio/synthesis.o(.rodata*);
        build/jp/src/audio/heap.o(.rodata*);
        build/jp/src/audio/load.o(.rodata*);
        build/jp/src/audio/playback.o(.rodata*);
        build/jp/src/audio/effects.o(.rodata*);
        build/jp/src/audio/seqplayer.o(.rodata*);
        build/jp/src/audio/external.o(.rodata*);
        build/jp/src/audio/port_eu.o(.rodata*);
        build/jp/src/audio*.o(.rodata*);
        build/jp/libultra.a:guPerspectiveF.o(.rodata*);
        build/jp/libultra.a:llconv.o(.rodata*);
        build/jp/libultra.a:cosf.o(.rodata*);
        build/jp/libultra.a:sinf.o(.rodata*);
        build/jp/libultra.a:guRotateF.o(.rodata*);
        build/jp/libultra.a:_Printf.o(.rodata*);
        build/jp/libultra.a:__osExceptionPreamble.o(.rodata*);
        build/jp/libultra.a:NaN.o(.rodata*);
        build/jp/libultra.a:_Litob.o(.rodata*);
        build/jp/libultra.a:_Ldtob.o(.rodata*);
        build/jp/libultra.a:osSetIntMask.o(.rodata*);
        build/jp/libultra.a:guLookAtRef.o(.rodata*);
        build/jp/libultra.a:*.o(.rodata*);
        build/jp/lib/rsp.o(.rodata*);
    }
    _mainSegmentEnd = ADDR(.main) + SIZEOF(.main); _mainSegmentRomEnd = __romPos + SIZEOF(.main); __romPos += SIZEOF(.main);
    _mainSegmentNoloadStart = ADDR(.main.noload); .main.noload (NOLOAD) :
    {
        build/jp/src/game/cn_common_syms_1.o(.bss*);
        build/jp/src/game/crash_screen.o(.bss*);
        build/jp/src/game/main.o(.bss*);
        build/jp/src/game/game_init.o(.bss*);
        build/jp/src/game/sound_init.o(.bss*);
        build/jp/src/game/level_update.o(.bss*);
        build/jp/src/game/interaction.o(.bss*);
        build/jp/src/game/mario.o(.bss*);
        build/jp/src/game/mario_actions_cutscene.o(.bss*);
        build/jp/src/game/mario_actions_moving.o(.bss*);
        build/jp/src/game/mario_actions_submerged.o(.bss*);
        build/jp/src/game/mario_misc.o(.bss*);
        build/jp/src/game/memory.o(.bss*);
        build/jp/src/game/save_file.o(.bss*);
        build/jp/src/game/area.o(.bss*);
        build/jp/src/game/rendering_graph_node.o(.bss*);
        build/jp/src/game/profiler.o(.bss*);
        build/jp/src/game/camera.o(.bss*);
        build/jp/src/game/object_list_processor.o(.bss*);
        build/jp/src/game/object_helpers.o(.bss*);
        build/jp/src/game/behavior_actions.o(.bss*);
        build/jp/src/game/debug.o(.bss*);
        build/jp/src/game/shadow.o(.bss*);
        build/jp/src/game/skybox.o(.bss*);
        build/jp/src/game/moving_texture.o(.bss*);
        build/jp/src/game/geo_misc.o(.bss*);
        build/jp/src/game/paintings.o(.bss*);
        build/jp/src/game/print.o(.bss*);
        build/jp/src/game/ingame_menu.o(.bss*);
        build/jp/src/game/envfx_snow.o(.bss*);
        build/jp/src/game/envfx_bubbles.o(.bss*);
        build/jp/src/game/macro_special_objects.o(.bss*);
        build/jp/src/game/hud.o(.bss*);
        build/jp/src/game/obj_behaviors.o(.bss*);
        build/jp/src/game/obj_behaviors_2.o(.bss*);
        build/jp/src/game*.o(.bss*);
        build/jp/src/audio/external.o(.bss*);
        build/jp/libultra.a:osSetEventMesg.o(.bss*);
        build/jp/libultra.a:osSpTaskLoadGo.o(.bss*);
        build/jp/libultra.a:osCreateViManager.o(.bss*);
        build/jp/libultra.a:osCreatePiManager.o(.bss*);
        build/jp/libultra.a:osInitialize.o(.bss*);
        build/jp/libultra.a:osContStartReadData.o(.bss*);
        build/jp/libultra.a:osContInit.o(.bss*);
        build/jp/libultra.a:guRotateF.o(.bss*);
        build/jp/libultra.a:osTimer.o(.bss*);
        build/jp/libultra.a:_Printf.o(.bss*);
        build/jp/libultra.a:__osPiCreateAccessQueue.o(.bss*);
        build/jp/libultra.a:__osSiCreateAccessQueue.o(.bss*);
        build/jp/libultra.a:osEepromWrite.o(.bss*);
        build/jp/libultra.a:kdebugserver_stack.o(.bss*);
        build/jp/libultra.a:kdebugserver.o(.bss*);
        build/jp/libultra.a:*.o(.bss*);
        build/jp/src/game/cn_common_syms_2.o(.bss*);
        . = ALIGN(0x8);
    }
    _mainSegmentNoloadEnd = ADDR(.main.noload) + SIZEOF(.main.noload);
    _mainSegmentNoloadSizeHi = (SIZEOF (.main.noload)) >> 16; _mainSegmentNoloadSizeLo = (SIZEOF (.main.noload)) & 0xffff;
    _engineSegmentStart = ADDR(.engine); _engineSegmentRomStart = __romPos; .engine (ALIGN(0x1000)) : AT(__romPos)
    {
        build/jp/src/engine/math_util.o(.text);
        build/jp/src/engine/graph_node.o(.text);
        build/jp/src/engine/graph_node_manager.o(.text);
        build/jp/src/engine/geo_layout.o(.text);
        build/jp/src/engine/level_script.o(.text);
        build/jp/src/engine/surface_collision.o(.text);
        build/jp/src/engine/surface_load.o(.text);
        build/jp/src/engine/behavior_script.o(.text);
        build/jp/src/engine*.o(.text);
        build/jp/src/engine/graph_node.o(.data*);
        build/jp/src/engine/graph_node_manager.o(.data*);
        build/jp/src/engine/math_util.o(.data*);
        build/jp/src/engine/geo_layout.o(.data*);
        build/jp/src/engine/level_script.o(.data*);
        build/jp/src/engine/behavior_script.o(.data*);
        build/jp/src/engine*.o(.data*);
        build/jp/src/engine/math_util.o(.rodata*);
        build/jp/src/engine/level_script.o(.rodata*);
        build/jp/src/engine/surface_collision.o(.rodata*);
        build/jp/src/engine/surface_load.o(.rodata*);
        build/jp/src/engine*.o(.rodata*);
    }
    _engineSegmentEnd = ADDR(.engine) + SIZEOF(.engine); _engineSegmentRomEnd = __romPos + SIZEOF(.engine); __romPos += SIZEOF(.engine);
    _engineSegmentNoloadStart = ADDR(.engine.noload); .engine.noload (NOLOAD) :
    {
        build/jp/src/engine/math_util.o(.bss*);
        build/jp/src/engine/geo_layout.o(.bss*);
        build/jp/src/engine/level_script.o(.bss*);
        build/jp/src/engine/surface_collision.o(.bss*);
        build/jp/src/engine/surface_load.o(.bss*);
        build/jp/src/engine/behavior_script.o(.bss*);
        build/jp/src/engine*.o(.bss*);
    }
    _engineSegmentNoloadEnd = ADDR(.engine.noload) + SIZEOF(.engine.noload);
    . = ALIGN(0x1000);
    _framebuffersSegmentNoloadStart = ADDR(.framebuffers.noload); .framebuffers.noload (NOLOAD) :
    {
        build/jp/src/buffers/framebuffers.o(.bss*);
    }
    _framebuffersSegmentNoloadEnd = ADDR(.framebuffers.noload) + SIZEOF(.framebuffers.noload);
    _entrySegmentStart = ADDR(.entry); _entrySegmentRomStart = __romPos; .entry (0x10000000) : AT(__romPos)
    {
        build/jp/levels/entry.o(.data);
    }
    _entrySegmentEnd = ADDR(.entry) + SIZEOF(.entry); _entrySegmentRomEnd = __romPos + SIZEOF(.entry); __romPos += SIZEOF(.entry);
    _segment2_mio0SegmentStart = ADDR(.segment2_mio0); _segment2_mio0SegmentRomStart = __romPos; .segment2_mio0 (0x02000000) : AT(__romPos) { build/jp/bin/segment2.mio0.o(.data); . = ALIGN(0x10); } _segment2_mio0SegmentEnd = ADDR(.segment2_mio0) + SIZEOF(.segment2_mio0); _segment2_mio0SegmentRomEnd = __romPos + SIZEOF(.segment2_mio0); __romPos += SIZEOF(.segment2_mio0);
    _group0_mio0SegmentStart = ADDR(.group0_mio0); _group0_mio0SegmentRomStart = __romPos; .group0_mio0 (0x04000000) : AT(__romPos) { build/jp/actors/group0.mio0.o(.data); . = ALIGN(0x10); } _group0_mio0SegmentEnd = ADDR(.group0_mio0) + SIZEOF(.group0_mio0); _group0_mio0SegmentRomEnd = __romPos + SIZEOF(.group0_mio0); __romPos += SIZEOF(.group0_mio0); _group0_geoSegmentStart = ADDR(.group0_geo); _group0_geoSegmentRomStart = __romPos; .group0_geo (0x17000000) : AT(__romPos) { build/jp/actors/group0_geo.o(.data); } _group0_geoSegmentEnd = ADDR(.group0_geo) + SIZEOF(.group0_geo); _group0_geoSegmentRomEnd = __romPos + SIZEOF(.group0_geo); __romPos += SIZEOF(.group0_geo);
    _group1_mio0SegmentStart = ADDR(.group1_mio0); _group1_mio0SegmentRomStart = __romPos; .group1_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group1.mio0.o(.data); . = ALIGN(0x10); } _group1_mio0SegmentEnd = ADDR(.group1_mio0) + SIZEOF(.group1_mio0); _group1_mio0SegmentRomEnd = __romPos + SIZEOF(.group1_mio0); __romPos += SIZEOF(.group1_mio0); _group1_geoSegmentStart = ADDR(.group1_geo); _group1_geoSegmentRomStart = __romPos; .group1_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group1_geo.o(.data); } _group1_geoSegmentEnd = ADDR(.group1_geo) + SIZEOF(.group1_geo); _group1_geoSegmentRomEnd = __romPos + SIZEOF(.group1_geo); __romPos += SIZEOF(.group1_geo);
    _group2_mio0SegmentStart = ADDR(.group2_mio0); _group2_mio0SegmentRomStart = __romPos; .group2_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group2.mio0.o(.data); . = ALIGN(0x10); } _group2_mio0SegmentEnd = ADDR(.group2_mio0) + SIZEOF(.group2_mio0); _group2_mio0SegmentRomEnd = __romPos + SIZEOF(.group2_mio0); __romPos += SIZEOF(.group2_mio0); _group2_geoSegmentStart = ADDR(.group2_geo); _group2_geoSegmentRomStart = __romPos; .group2_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group2_geo.o(.data); } _group2_geoSegmentEnd = ADDR(.group2_geo) + SIZEOF(.group2_geo); _group2_geoSegmentRomEnd = __romPos + SIZEOF(.group2_geo); __romPos += SIZEOF(.group2_geo);
    _group3_mio0SegmentStart = ADDR(.group3_mio0); _group3_mio0SegmentRomStart = __romPos; .group3_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group3.mio0.o(.data); . = ALIGN(0x10); } _group3_mio0SegmentEnd = ADDR(.group3_mio0) + SIZEOF(.group3_mio0); _group3_mio0SegmentRomEnd = __romPos + SIZEOF(.group3_mio0); __romPos += SIZEOF(.group3_mio0); _group3_geoSegmentStart = ADDR(.group3_geo); _group3_geoSegmentRomStart = __romPos; .group3_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group3_geo.o(.data); } _group3_geoSegmentEnd = ADDR(.group3_geo) + SIZEOF(.group3_geo); _group3_geoSegmentRomEnd = __romPos + SIZEOF(.group3_geo); __romPos += SIZEOF(.group3_geo);
    _group4_mio0SegmentStart = ADDR(.group4_mio0); _group4_mio0SegmentRomStart = __romPos; .group4_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group4.mio0.o(.data); . = ALIGN(0x10); } _group4_mio0SegmentEnd = ADDR(.group4_mio0) + SIZEOF(.group4_mio0); _group4_mio0SegmentRomEnd = __romPos + SIZEOF(.group4_mio0); __romPos += SIZEOF(.group4_mio0); _group4_geoSegmentStart = ADDR(.group4_geo); _group4_geoSegmentRomStart = __romPos; .group4_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group4_geo.o(.data); } _group4_geoSegmentEnd = ADDR(.group4_geo) + SIZEOF(.group4_geo); _group4_geoSegmentRomEnd = __romPos + SIZEOF(.group4_geo); __romPos += SIZEOF(.group4_geo);
    _group5_mio0SegmentStart = ADDR(.group5_mio0); _group5_mio0SegmentRomStart = __romPos; .group5_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group5.mio0.o(.data); . = ALIGN(0x10); } _group5_mio0SegmentEnd = ADDR(.group5_mio0) + SIZEOF(.group5_mio0); _group5_mio0SegmentRomEnd = __romPos + SIZEOF(.group5_mio0); __romPos += SIZEOF(.group5_mio0); _group5_geoSegmentStart = ADDR(.group5_geo); _group5_geoSegmentRomStart = __romPos; .group5_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group5_geo.o(.data); } _group5_geoSegmentEnd = ADDR(.group5_geo) + SIZEOF(.group5_geo); _group5_geoSegmentRomEnd = __romPos + SIZEOF(.group5_geo); __romPos += SIZEOF(.group5_geo);
    _group6_mio0SegmentStart = ADDR(.group6_mio0); _group6_mio0SegmentRomStart = __romPos; .group6_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group6.mio0.o(.data); . = ALIGN(0x10); } _group6_mio0SegmentEnd = ADDR(.group6_mio0) + SIZEOF(.group6_mio0); _group6_mio0SegmentRomEnd = __romPos + SIZEOF(.group6_mio0); __romPos += SIZEOF(.group6_mio0); _group6_geoSegmentStart = ADDR(.group6_geo); _group6_geoSegmentRomStart = __romPos; .group6_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group6_geo.o(.data); } _group6_geoSegmentEnd = ADDR(.group6_geo) + SIZEOF(.group6_geo); _group6_geoSegmentRomEnd = __romPos + SIZEOF(.group6_geo); __romPos += SIZEOF(.group6_geo);
    _group7_mio0SegmentStart = ADDR(.group7_mio0); _group7_mio0SegmentRomStart = __romPos; .group7_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group7.mio0.o(.data); . = ALIGN(0x10); } _group7_mio0SegmentEnd = ADDR(.group7_mio0) + SIZEOF(.group7_mio0); _group7_mio0SegmentRomEnd = __romPos + SIZEOF(.group7_mio0); __romPos += SIZEOF(.group7_mio0); _group7_geoSegmentStart = ADDR(.group7_geo); _group7_geoSegmentRomStart = __romPos; .group7_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group7_geo.o(.data); } _group7_geoSegmentEnd = ADDR(.group7_geo) + SIZEOF(.group7_geo); _group7_geoSegmentRomEnd = __romPos + SIZEOF(.group7_geo); __romPos += SIZEOF(.group7_geo);
    _group8_mio0SegmentStart = ADDR(.group8_mio0); _group8_mio0SegmentRomStart = __romPos; .group8_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group8.mio0.o(.data); . = ALIGN(0x10); } _group8_mio0SegmentEnd = ADDR(.group8_mio0) + SIZEOF(.group8_mio0); _group8_mio0SegmentRomEnd = __romPos + SIZEOF(.group8_mio0); __romPos += SIZEOF(.group8_mio0); _group8_geoSegmentStart = ADDR(.group8_geo); _group8_geoSegmentRomStart = __romPos; .group8_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group8_geo.o(.data); } _group8_geoSegmentEnd = ADDR(.group8_geo) + SIZEOF(.group8_geo); _group8_geoSegmentRomEnd = __romPos + SIZEOF(.group8_geo); __romPos += SIZEOF(.group8_geo);
    _group9_mio0SegmentStart = ADDR(.group9_mio0); _group9_mio0SegmentRomStart = __romPos; .group9_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group9.mio0.o(.data); . = ALIGN(0x10); } _group9_mio0SegmentEnd = ADDR(.group9_mio0) + SIZEOF(.group9_mio0); _group9_mio0SegmentRomEnd = __romPos + SIZEOF(.group9_mio0); __romPos += SIZEOF(.group9_mio0); _group9_geoSegmentStart = ADDR(.group9_geo); _group9_geoSegmentRomStart = __romPos; .group9_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group9_geo.o(.data); } _group9_geoSegmentEnd = ADDR(.group9_geo) + SIZEOF(.group9_geo); _group9_geoSegmentRomEnd = __romPos + SIZEOF(.group9_geo); __romPos += SIZEOF(.group9_geo);
    _group10_mio0SegmentStart = ADDR(.group10_mio0); _group10_mio0SegmentRomStart = __romPos; .group10_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group10.mio0.o(.data); . = ALIGN(0x10); } _group10_mio0SegmentEnd = ADDR(.group10_mio0) + SIZEOF(.group10_mio0); _group10_mio0SegmentRomEnd = __romPos + SIZEOF(.group10_mio0); __romPos += SIZEOF(.group10_mio0); _group10_geoSegmentStart = ADDR(.group10_geo); _group10_geoSegmentRomStart = __romPos; .group10_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group10_geo.o(.data); } _group10_geoSegmentEnd = ADDR(.group10_geo) + SIZEOF(.group10_geo); _group10_geoSegmentRomEnd = __romPos + SIZEOF(.group10_geo); __romPos += SIZEOF(.group10_geo);
    _group11_mio0SegmentStart = ADDR(.group11_mio0); _group11_mio0SegmentRomStart = __romPos; .group11_mio0 (0x05000000) : AT(__romPos) { build/jp/actors/group11.mio0.o(.data); . = ALIGN(0x10); } _group11_mio0SegmentEnd = ADDR(.group11_mio0) + SIZEOF(.group11_mio0); _group11_mio0SegmentRomEnd = __romPos + SIZEOF(.group11_mio0); __romPos += SIZEOF(.group11_mio0); _group11_geoSegmentStart = ADDR(.group11_geo); _group11_geoSegmentRomStart = __romPos; .group11_geo (0x0C000000) : AT(__romPos) { build/jp/actors/group11_geo.o(.data); } _group11_geoSegmentEnd = ADDR(.group11_geo) + SIZEOF(.group11_geo); _group11_geoSegmentRomEnd = __romPos + SIZEOF(.group11_geo); __romPos += SIZEOF(.group11_geo);
    _group12_mio0SegmentStart = ADDR(.group12_mio0); _group12_mio0SegmentRomStart = __romPos; .group12_mio0 (0x06000000) : AT(__romPos) { build/jp/actors/group12.mio0.o(.data); . = ALIGN(0x10); } _group12_mio0SegmentEnd = ADDR(.group12_mio0) + SIZEOF(.group12_mio0); _group12_mio0SegmentRomEnd = __romPos + SIZEOF(.group12_mio0); __romPos += SIZEOF(.group12_mio0); _group12_geoSegmentStart = ADDR(.group12_geo); _group12_geoSegmentRomStart = __romPos; .group12_geo (0x0D000000) : AT(__romPos) { build/jp/actors/group12_geo.o(.data); } _group12_geoSegmentEnd = ADDR(.group12_geo) + SIZEOF(.group12_geo); _group12_geoSegmentRomEnd = __romPos + SIZEOF(.group12_geo); __romPos += SIZEOF(.group12_geo);
    _group13_mio0SegmentStart = ADDR(.group13_mio0); _group13_mio0SegmentRomStart = __romPos; .group13_mio0 (0x06000000) : AT(__romPos) { build/jp/actors/group13.mio0.o(.data); . = ALIGN(0x10); } _group13_mio0SegmentEnd = ADDR(.group13_mio0) + SIZEOF(.group13_mio0); _group13_mio0SegmentRomEnd = __romPos + SIZEOF(.group13_mio0); __romPos += SIZEOF(.group13_mio0); _group13_geoSegmentStart = ADDR(.group13_geo); _group13_geoSegmentRomStart = __romPos; .group13_geo (0x0D000000) : AT(__romPos) { build/jp/actors/group13_geo.o(.data); } _group13_geoSegmentEnd = ADDR(.group13_geo) + SIZEOF(.group13_geo); _group13_geoSegmentRomEnd = __romPos + SIZEOF(.group13_geo); __romPos += SIZEOF(.group13_geo);
    _group14_mio0SegmentStart = ADDR(.group14_mio0); _group14_mio0SegmentRomStart = __romPos; .group14_mio0 (0x06000000) : AT(__romPos) { build/jp/actors/group14.mio0.o(.data); . = ALIGN(0x10); } _group14_mio0SegmentEnd = ADDR(.group14_mio0) + SIZEOF(.group14_mio0); _group14_mio0SegmentRomEnd = __romPos + SIZEOF(.group14_mio0); __romPos += SIZEOF(.group14_mio0); _group14_geoSegmentStart = ADDR(.group14_geo); _group14_geoSegmentRomStart = __romPos; .group14_geo (0x0D000000) : AT(__romPos) { build/jp/actors/group14_geo.o(.data); } _group14_geoSegmentEnd = ADDR(.group14_geo) + SIZEOF(.group14_geo); _group14_geoSegmentRomEnd = __romPos + SIZEOF(.group14_geo); __romPos += SIZEOF(.group14_geo);
    _group15_mio0SegmentStart = ADDR(.group15_mio0); _group15_mio0SegmentRomStart = __romPos; .group15_mio0 (0x06000000) : AT(__romPos) { build/jp/actors/group15.mio0.o(.data); . = ALIGN(0x10); } _group15_mio0SegmentEnd = ADDR(.group15_mio0) + SIZEOF(.group15_mio0); _group15_mio0SegmentRomEnd = __romPos + SIZEOF(.group15_mio0); __romPos += SIZEOF(.group15_mio0); _group15_geoSegmentStart = ADDR(.group15_geo); _group15_geoSegmentRomStart = __romPos; .group15_geo (0x0D000000) : AT(__romPos) { build/jp/actors/group15_geo.o(.data); } _group15_geoSegmentEnd = ADDR(.group15_geo) + SIZEOF(.group15_geo); _group15_geoSegmentRomEnd = __romPos + SIZEOF(.group15_geo); __romPos += SIZEOF(.group15_geo);
    _group16_mio0SegmentStart = ADDR(.group16_mio0); _group16_mio0SegmentRomStart = __romPos; .group16_mio0 (0x06000000) : AT(__romPos) { build/jp/actors/group16.mio0.o(.data); . = ALIGN(0x10); } _group16_mio0SegmentEnd = ADDR(.group16_mio0) + SIZEOF(.group16_mio0); _group16_mio0SegmentRomEnd = __romPos + SIZEOF(.group16_mio0); __romPos += SIZEOF(.group16_mio0); _group16_geoSegmentStart = ADDR(.group16_geo); _group16_geoSegmentRomStart = __romPos; .group16_geo (0x0D000000) : AT(__romPos) { build/jp/actors/group16_geo.o(.data); } _group16_geoSegmentEnd = ADDR(.group16_geo) + SIZEOF(.group16_geo); _group16_geoSegmentRomEnd = __romPos + SIZEOF(.group16_geo); __romPos += SIZEOF(.group16_geo);
    _group17_mio0SegmentStart = ADDR(.group17_mio0); _group17_mio0SegmentRomStart = __romPos; .group17_mio0 (0x06000000) : AT(__romPos) { build/jp/actors/group17.mio0.o(.data); . = ALIGN(0x10); } _group17_mio0SegmentEnd = ADDR(.group17_mio0) + SIZEOF(.group17_mio0); _group17_mio0SegmentRomEnd = __romPos + SIZEOF(.group17_mio0); __romPos += SIZEOF(.group17_mio0); _group17_geoSegmentStart = ADDR(.group17_geo); _group17_geoSegmentRomStart = __romPos; .group17_geo (0x0D000000) : AT(__romPos) { build/jp/actors/group17_geo.o(.data); } _group17_geoSegmentEnd = ADDR(.group17_geo) + SIZEOF(.group17_geo); _group17_geoSegmentRomEnd = __romPos + SIZEOF(.group17_geo); __romPos += SIZEOF(.group17_geo);
    _common0_mio0SegmentStart = ADDR(.common0_mio0); _common0_mio0SegmentRomStart = __romPos; .common0_mio0 (0x08000000) : AT(__romPos) { build/jp/actors/common0.mio0.o(.data); . = ALIGN(0x10); } _common0_mio0SegmentEnd = ADDR(.common0_mio0) + SIZEOF(.common0_mio0); _common0_mio0SegmentRomEnd = __romPos + SIZEOF(.common0_mio0); __romPos += SIZEOF(.common0_mio0); _common0_geoSegmentStart = ADDR(.common0_geo); _common0_geoSegmentRomStart = __romPos; .common0_geo (0x0F000000) : AT(__romPos) { build/jp/actors/common0_geo.o(.data); } _common0_geoSegmentEnd = ADDR(.common0_geo) + SIZEOF(.common0_geo); _common0_geoSegmentRomEnd = __romPos + SIZEOF(.common0_geo); __romPos += SIZEOF(.common0_geo);
    _common1_mio0SegmentStart = ADDR(.common1_mio0); _common1_mio0SegmentRomStart = __romPos; .common1_mio0 (0x03000000) : AT(__romPos) { build/jp/actors/common1.mio0.o(.data); . = ALIGN(0x10); } _common1_mio0SegmentEnd = ADDR(.common1_mio0) + SIZEOF(.common1_mio0); _common1_mio0SegmentRomEnd = __romPos + SIZEOF(.common1_mio0); __romPos += SIZEOF(.common1_mio0); _common1_geoSegmentStart = ADDR(.common1_geo); _common1_geoSegmentRomStart = __romPos; .common1_geo (0x16000000) : AT(__romPos) { build/jp/actors/common1_geo.o(.data); } _common1_geoSegmentEnd = ADDR(.common1_geo) + SIZEOF(.common1_geo); _common1_geoSegmentRomEnd = __romPos + SIZEOF(.common1_geo); __romPos += SIZEOF(.common1_geo);
    _behaviorSegmentStart = ADDR(.behavior); _behaviorSegmentRomStart = __romPos; .behavior (0x13000000) : AT(__romPos)
    {
        build/jp/data/behavior_data.o(.data);
    }
    _behaviorSegmentEnd = ADDR(.behavior) + SIZEOF(.behavior); _behaviorSegmentRomEnd = __romPos + SIZEOF(.behavior); __romPos += SIZEOF(.behavior);
    _goddardSegmentStart = ADDR(.goddard); _goddardSegmentRomStart = __romPos; .goddard ((0x80800000 - 0x52000)) : AT(__romPos)
    {
        build/jp/src/menu/title_screen.o(.text);
        build/jp/src/menu/intro_geo.o(.text);
        build/jp/src/menu/file_select.o(.text);
        build/jp/src/menu/star_select.o(.text);
        build/jp/src/menu*.o(.text);
        build/jp/libgoddard.a:gd_main.o(.text);
        build/jp/libgoddard.a:gd_memory.o(.text);
        build/jp/libgoddard.a:sfx.o(.text);
        build/jp/libgoddard.a:draw_objects.o(.text);
        build/jp/libgoddard.a:objects.o(.text);
        build/jp/libgoddard.a:skin_movement.o(.text);
        build/jp/libgoddard.a:particles.o(.text);
        build/jp/libgoddard.a:dynlist_proc.o(.text);
        build/jp/libgoddard.a:old_menu.o(.text);
        build/jp/libgoddard.a:debug_utils.o(.text);
        build/jp/libgoddard.a:joints.o(.text);
        build/jp/libgoddard.a:skin.o(.text);
        build/jp/libgoddard.a:gd_math.o(.text);
        build/jp/libgoddard.a:shape_helper.o(.text);
        build/jp/libgoddard.a:renderer.o(.text);
        build/jp/libgoddard.a:*.o(.text);
        build/jp/src/menu/title_screen.o(.data*);
        build/jp/src/menu/title_screen.o(.rodata*);
        build/jp/src/menu/intro_geo.o(.data*);
        build/jp/src/menu/file_select.o(.data*);
        build/jp/src/menu/file_select.o(.rodata*);
        build/jp/src/menu/star_select.o(.data*);
        build/jp/src/menu/star_select.o(.rodata*);
        build/jp/src/menu*.o(.data*);
        build/jp/src/menu*.o(.rodata*);
        build/jp/libgoddard.a:gd_main.o(.data*);
        build/jp/libgoddard.a:draw_objects.o(.data*);
        build/jp/libgoddard.a:objects.o(.data*);
        build/jp/libgoddard.a:particles.o(.data*);
        build/jp/libgoddard.a:dynlist_proc.o(.data*);
        build/jp/libgoddard.a:debug_utils.o(.data*);
        build/jp/libgoddard.a:joints.o(.data*);
        build/jp/libgoddard.a:shape_helper.o(.data*);
        build/jp/libgoddard.a:renderer.o(.data*);
        build/jp/libgoddard.a:gd_main.o(.rodata*);
        build/jp/libgoddard.a:gd_memory.o(.rodata*);
        build/jp/libgoddard.a:draw_objects.o(.rodata*);
        build/jp/libgoddard.a:objects.o(.rodata*);
        build/jp/libgoddard.a:skin_movement.o(.rodata*);
        build/jp/libgoddard.a:particles.o(.rodata*);
        build/jp/libgoddard.a:dynlist_proc.o(.rodata*);
        build/jp/libgoddard.a:old_menu.o(.rodata*);
        build/jp/libgoddard.a:debug_utils.o(.rodata*);
        build/jp/libgoddard.a:joints.o(.rodata*);
        build/jp/libgoddard.a:skin.o(.rodata*);
        build/jp/libgoddard.a:gd_math.o(.rodata*);
        build/jp/libgoddard.a:shape_helper.o(.rodata*);
        build/jp/libgoddard.a:renderer.o(.rodata*);
    }
    _goddardSegmentEnd = ADDR(.goddard) + SIZEOF(.goddard); _goddardSegmentRomEnd = __romPos + SIZEOF(.goddard); __romPos += SIZEOF(.goddard);
    _goddardSegmentNoloadStart = ADDR(.goddard.noload); .goddard.noload (NOLOAD) :
    {
        build/jp/src/menu/intro_geo.o(.bss*);
        build/jp/src/menu/file_select.o(.bss*);
        build/jp/src/menu/star_select.o(.bss*);
        build/jp/src/menu*.o(.bss*);
        build/jp/libgoddard.a:gd_main.o(.bss*);
        build/jp/libgoddard.a:gd_memory.o(.bss*);
        build/jp/libgoddard.a:sfx.o(.bss*);
        build/jp/libgoddard.a:draw_objects.o(.bss*);
        build/jp/libgoddard.a:objects.o(.bss*);
        build/jp/libgoddard.a:skin_movement.o(.bss*);
        build/jp/libgoddard.a:particles.o(.bss*);
        build/jp/libgoddard.a:dynlist_proc.o(.bss*);
        build/jp/libgoddard.a:old_menu.o(.bss*);
        build/jp/libgoddard.a:debug_utils.o(.bss*);
        build/jp/libgoddard.a:joints.o(.bss*);
        build/jp/libgoddard.a:skin.o(.bss*);
        build/jp/libgoddard.a:shape_helper.o(.bss*);
        build/jp/libgoddard.a:renderer.o(.bss*);
        build/jp/libgoddard.a:*.o(.bss*);
    }
    _goddardSegmentNoloadEnd = ADDR(.goddard.noload) + SIZEOF(.goddard.noload);
    _introSegmentStart = ADDR(.intro); _introSegmentRomStart = __romPos; .intro (0x14000000) : AT(__romPos)
    {
        build/jp/levels/intro/script.o(.data);
        build/jp/levels/intro/geo.o(.data);
    }
    _introSegmentEnd = ADDR(.intro) + SIZEOF(.intro); _introSegmentRomEnd = __romPos + SIZEOF(.intro); __romPos += SIZEOF(.intro);
    _intro_segment_7SegmentStart = ADDR(.intro_segment_7); _intro_segment_7SegmentRomStart = __romPos; .intro_segment_7 (0x07000000) : AT(__romPos)
    {
        build/jp/levels/intro/leveldata.mio0.o(.data);
        . = ALIGN(0x10);
    }
    _intro_segment_7SegmentEnd = ADDR(.intro_segment_7) + SIZEOF(.intro_segment_7); _intro_segment_7SegmentRomEnd = __romPos + SIZEOF(.intro_segment_7); __romPos += SIZEOF(.intro_segment_7);
    _debug_level_select_mio0SegmentStart = ADDR(.debug_level_select_mio0); _debug_level_select_mio0SegmentRomStart = __romPos; .debug_level_select_mio0 (0x07000000) : AT(__romPos) { build/jp/bin/debug_level_select.mio0.o(.data); . = ALIGN(0x10); } _debug_level_select_mio0SegmentEnd = ADDR(.debug_level_select_mio0) + SIZEOF(.debug_level_select_mio0); _debug_level_select_mio0SegmentRomEnd = __romPos + SIZEOF(.debug_level_select_mio0); __romPos += SIZEOF(.debug_level_select_mio0);
    _title_screen_bg_mio0SegmentStart = ADDR(.title_screen_bg_mio0); _title_screen_bg_mio0SegmentRomStart = __romPos; .title_screen_bg_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/title_screen_bg.mio0.o(.data); . = ALIGN(0x10); } _title_screen_bg_mio0SegmentEnd = ADDR(.title_screen_bg_mio0) + SIZEOF(.title_screen_bg_mio0); _title_screen_bg_mio0SegmentRomEnd = __romPos + SIZEOF(.title_screen_bg_mio0); __romPos += SIZEOF(.title_screen_bg_mio0);
    _gd_dynlistsSegmentStart = ADDR(.gd_dynlists); _gd_dynlistsSegmentRomStart = __romPos; .gd_dynlists (0x04000000) : AT(__romPos)
    {
        build/jp/libgoddard.a:dynlist_test_cube.o(.data);
        build/jp/libgoddard.a:dynlist_unused.o(.data);
        build/jp/libgoddard.a:dynlist_mario_face.o(.data);
        build/jp/libgoddard.a:dynlists_mario_eyes.o(.data);
        build/jp/libgoddard.a:dynlists_mario_eyebrows_mustache.o(.data);
        build/jp/libgoddard.a:dynlist_mario_master.o(.data);
        build/jp/libgoddard.a:anim_mario_mustache_right.o(.data);
        build/jp/libgoddard.a:anim_mario_mustache_left.o(.data);
        build/jp/libgoddard.a:anim_mario_lips_1.o(.data);
        build/jp/libgoddard.a:anim_mario_lips_2.o(.data);
        build/jp/libgoddard.a:anim_mario_eyebrows_1.o(.data);
        build/jp/libgoddard.a:anim_group_1.o(.data);
        build/jp/libgoddard.a:anim_group_2.o(.data);
        build/jp/libgoddard.a:dynlist_test_cube.o(.rodata*);
        build/jp/libgoddard.a:dynlist_unused.o(.rodata*);
        build/jp/libgoddard.a:*.o(.data);
        build/jp/libgoddard.a:*.o(.rodata);
    }
    _gd_dynlistsSegmentEnd = ADDR(.gd_dynlists) + SIZEOF(.gd_dynlists); _gd_dynlistsSegmentRomEnd = __romPos + SIZEOF(.gd_dynlists); __romPos += SIZEOF(.gd_dynlists);
    gMainLevels = __romPos;
    _menuSegmentStart = ADDR(.menu); _menuSegmentRomStart = __romPos; .menu (0x14000000) : AT(__romPos)
    {
        build/jp/levels/menu/script.o(.data);
        build/jp/levels/menu/geo.o(.data);
    }
    _menuSegmentEnd = ADDR(.menu) + SIZEOF(.menu); _menuSegmentRomEnd = __romPos + SIZEOF(.menu); __romPos += SIZEOF(.menu);
    _menu_segment_7SegmentStart = ADDR(.menu_segment_7); _menu_segment_7SegmentRomStart = __romPos; .menu_segment_7 (0x07000000) : AT(__romPos)
    {
        build/jp/levels/menu/leveldata.mio0.o(.data);
        . = ALIGN(0x10);
    }
    _menu_segment_7SegmentEnd = ADDR(.menu_segment_7) + SIZEOF(.menu_segment_7); _menu_segment_7SegmentRomEnd = __romPos + SIZEOF(.menu_segment_7); __romPos += SIZEOF(.menu_segment_7);
    _scriptsSegmentStart = ADDR(.scripts); _scriptsSegmentRomStart = __romPos; .scripts (0x15000000) : AT(__romPos)
    {
        build/jp/levels/scripts.o(.data);
    }
    _scriptsSegmentEnd = ADDR(.scripts) + SIZEOF(.scripts); _scriptsSegmentRomEnd = __romPos + SIZEOF(.scripts); __romPos += SIZEOF(.scripts);
    _water_skybox_mio0SegmentStart = ADDR(.water_skybox_mio0); _water_skybox_mio0SegmentRomStart = __romPos; .water_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/water_skybox.mio0.o(.data); . = ALIGN(0x10); } _water_skybox_mio0SegmentEnd = ADDR(.water_skybox_mio0) + SIZEOF(.water_skybox_mio0); _water_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.water_skybox_mio0); __romPos += SIZEOF(.water_skybox_mio0);
    _ccm_skybox_mio0SegmentStart = ADDR(.ccm_skybox_mio0); _ccm_skybox_mio0SegmentRomStart = __romPos; .ccm_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/ccm_skybox.mio0.o(.data); . = ALIGN(0x10); } _ccm_skybox_mio0SegmentEnd = ADDR(.ccm_skybox_mio0) + SIZEOF(.ccm_skybox_mio0); _ccm_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.ccm_skybox_mio0); __romPos += SIZEOF(.ccm_skybox_mio0);
    _clouds_skybox_mio0SegmentStart = ADDR(.clouds_skybox_mio0); _clouds_skybox_mio0SegmentRomStart = __romPos; .clouds_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/clouds_skybox.mio0.o(.data); . = ALIGN(0x10); } _clouds_skybox_mio0SegmentEnd = ADDR(.clouds_skybox_mio0) + SIZEOF(.clouds_skybox_mio0); _clouds_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.clouds_skybox_mio0); __romPos += SIZEOF(.clouds_skybox_mio0);
    _bitfs_skybox_mio0SegmentStart = ADDR(.bitfs_skybox_mio0); _bitfs_skybox_mio0SegmentRomStart = __romPos; .bitfs_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/bitfs_skybox.mio0.o(.data); . = ALIGN(0x10); } _bitfs_skybox_mio0SegmentEnd = ADDR(.bitfs_skybox_mio0) + SIZEOF(.bitfs_skybox_mio0); _bitfs_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.bitfs_skybox_mio0); __romPos += SIZEOF(.bitfs_skybox_mio0);
    _wdw_skybox_mio0SegmentStart = ADDR(.wdw_skybox_mio0); _wdw_skybox_mio0SegmentRomStart = __romPos; .wdw_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/wdw_skybox.mio0.o(.data); . = ALIGN(0x10); } _wdw_skybox_mio0SegmentEnd = ADDR(.wdw_skybox_mio0) + SIZEOF(.wdw_skybox_mio0); _wdw_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.wdw_skybox_mio0); __romPos += SIZEOF(.wdw_skybox_mio0);
    _cloud_floor_skybox_mio0SegmentStart = ADDR(.cloud_floor_skybox_mio0); _cloud_floor_skybox_mio0SegmentRomStart = __romPos; .cloud_floor_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/cloud_floor_skybox.mio0.o(.data); . = ALIGN(0x10); } _cloud_floor_skybox_mio0SegmentEnd = ADDR(.cloud_floor_skybox_mio0) + SIZEOF(.cloud_floor_skybox_mio0); _cloud_floor_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.cloud_floor_skybox_mio0); __romPos += SIZEOF(.cloud_floor_skybox_mio0);
    _ssl_skybox_mio0SegmentStart = ADDR(.ssl_skybox_mio0); _ssl_skybox_mio0SegmentRomStart = __romPos; .ssl_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/ssl_skybox.mio0.o(.data); . = ALIGN(0x10); } _ssl_skybox_mio0SegmentEnd = ADDR(.ssl_skybox_mio0) + SIZEOF(.ssl_skybox_mio0); _ssl_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.ssl_skybox_mio0); __romPos += SIZEOF(.ssl_skybox_mio0);
    _bbh_skybox_mio0SegmentStart = ADDR(.bbh_skybox_mio0); _bbh_skybox_mio0SegmentRomStart = __romPos; .bbh_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/bbh_skybox.mio0.o(.data); . = ALIGN(0x10); } _bbh_skybox_mio0SegmentEnd = ADDR(.bbh_skybox_mio0) + SIZEOF(.bbh_skybox_mio0); _bbh_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.bbh_skybox_mio0); __romPos += SIZEOF(.bbh_skybox_mio0);
    _bidw_skybox_mio0SegmentStart = ADDR(.bidw_skybox_mio0); _bidw_skybox_mio0SegmentRomStart = __romPos; .bidw_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/bidw_skybox.mio0.o(.data); . = ALIGN(0x10); } _bidw_skybox_mio0SegmentEnd = ADDR(.bidw_skybox_mio0) + SIZEOF(.bidw_skybox_mio0); _bidw_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.bidw_skybox_mio0); __romPos += SIZEOF(.bidw_skybox_mio0);
    _bits_skybox_mio0SegmentStart = ADDR(.bits_skybox_mio0); _bits_skybox_mio0SegmentRomStart = __romPos; .bits_skybox_mio0 (0x0A000000) : AT(__romPos) { build/jp/bin/bits_skybox.mio0.o(.data); . = ALIGN(0x10); } _bits_skybox_mio0SegmentEnd = ADDR(.bits_skybox_mio0) + SIZEOF(.bits_skybox_mio0); _bits_skybox_mio0SegmentRomEnd = __romPos + SIZEOF(.bits_skybox_mio0); __romPos += SIZEOF(.bits_skybox_mio0);
    _fire_mio0SegmentStart = ADDR(.fire_mio0); _fire_mio0SegmentRomStart = __romPos; .fire_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/fire.mio0.o(.data); . = ALIGN(0x10); } _fire_mio0SegmentEnd = ADDR(.fire_mio0) + SIZEOF(.fire_mio0); _fire_mio0SegmentRomEnd = __romPos + SIZEOF(.fire_mio0); __romPos += SIZEOF(.fire_mio0);
    _spooky_mio0SegmentStart = ADDR(.spooky_mio0); _spooky_mio0SegmentRomStart = __romPos; .spooky_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/spooky.mio0.o(.data); . = ALIGN(0x10); } _spooky_mio0SegmentEnd = ADDR(.spooky_mio0) + SIZEOF(.spooky_mio0); _spooky_mio0SegmentRomEnd = __romPos + SIZEOF(.spooky_mio0); __romPos += SIZEOF(.spooky_mio0);
    _generic_mio0SegmentStart = ADDR(.generic_mio0); _generic_mio0SegmentRomStart = __romPos; .generic_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/generic.mio0.o(.data); . = ALIGN(0x10); } _generic_mio0SegmentEnd = ADDR(.generic_mio0) + SIZEOF(.generic_mio0); _generic_mio0SegmentRomEnd = __romPos + SIZEOF(.generic_mio0); __romPos += SIZEOF(.generic_mio0);
    _water_mio0SegmentStart = ADDR(.water_mio0); _water_mio0SegmentRomStart = __romPos; .water_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/water.mio0.o(.data); . = ALIGN(0x10); } _water_mio0SegmentEnd = ADDR(.water_mio0) + SIZEOF(.water_mio0); _water_mio0SegmentRomEnd = __romPos + SIZEOF(.water_mio0); __romPos += SIZEOF(.water_mio0);
    _sky_mio0SegmentStart = ADDR(.sky_mio0); _sky_mio0SegmentRomStart = __romPos; .sky_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/sky.mio0.o(.data); . = ALIGN(0x10); } _sky_mio0SegmentEnd = ADDR(.sky_mio0) + SIZEOF(.sky_mio0); _sky_mio0SegmentRomEnd = __romPos + SIZEOF(.sky_mio0); __romPos += SIZEOF(.sky_mio0);
    _snow_mio0SegmentStart = ADDR(.snow_mio0); _snow_mio0SegmentRomStart = __romPos; .snow_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/snow.mio0.o(.data); . = ALIGN(0x10); } _snow_mio0SegmentEnd = ADDR(.snow_mio0) + SIZEOF(.snow_mio0); _snow_mio0SegmentRomEnd = __romPos + SIZEOF(.snow_mio0); __romPos += SIZEOF(.snow_mio0);
    _cave_mio0SegmentStart = ADDR(.cave_mio0); _cave_mio0SegmentRomStart = __romPos; .cave_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/cave.mio0.o(.data); . = ALIGN(0x10); } _cave_mio0SegmentEnd = ADDR(.cave_mio0) + SIZEOF(.cave_mio0); _cave_mio0SegmentRomEnd = __romPos + SIZEOF(.cave_mio0); __romPos += SIZEOF(.cave_mio0);
    _machine_mio0SegmentStart = ADDR(.machine_mio0); _machine_mio0SegmentRomStart = __romPos; .machine_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/machine.mio0.o(.data); . = ALIGN(0x10); } _machine_mio0SegmentEnd = ADDR(.machine_mio0) + SIZEOF(.machine_mio0); _machine_mio0SegmentRomEnd = __romPos + SIZEOF(.machine_mio0); __romPos += SIZEOF(.machine_mio0);
    _mountain_mio0SegmentStart = ADDR(.mountain_mio0); _mountain_mio0SegmentRomStart = __romPos; .mountain_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/mountain.mio0.o(.data); . = ALIGN(0x10); } _mountain_mio0SegmentEnd = ADDR(.mountain_mio0) + SIZEOF(.mountain_mio0); _mountain_mio0SegmentRomEnd = __romPos + SIZEOF(.mountain_mio0); __romPos += SIZEOF(.mountain_mio0);
    _grass_mio0SegmentStart = ADDR(.grass_mio0); _grass_mio0SegmentRomStart = __romPos; .grass_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/grass.mio0.o(.data); . = ALIGN(0x10); } _grass_mio0SegmentEnd = ADDR(.grass_mio0) + SIZEOF(.grass_mio0); _grass_mio0SegmentRomEnd = __romPos + SIZEOF(.grass_mio0); __romPos += SIZEOF(.grass_mio0);
    _outside_mio0SegmentStart = ADDR(.outside_mio0); _outside_mio0SegmentRomStart = __romPos; .outside_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/outside.mio0.o(.data); . = ALIGN(0x10); } _outside_mio0SegmentEnd = ADDR(.outside_mio0) + SIZEOF(.outside_mio0); _outside_mio0SegmentRomEnd = __romPos + SIZEOF(.outside_mio0); __romPos += SIZEOF(.outside_mio0);
    _inside_mio0SegmentStart = ADDR(.inside_mio0); _inside_mio0SegmentRomStart = __romPos; .inside_mio0 (0x09000000) : AT(__romPos) { build/jp/bin/inside.mio0.o(.data); . = ALIGN(0x10); } _inside_mio0SegmentEnd = ADDR(.inside_mio0) + SIZEOF(.inside_mio0); _inside_mio0SegmentRomEnd = __romPos + SIZEOF(.inside_mio0); __romPos += SIZEOF(.inside_mio0);
    _effect_mio0SegmentStart = ADDR(.effect_mio0); _effect_mio0SegmentRomStart = __romPos; .effect_mio0 (0x0B000000) : AT(__romPos) { build/jp/bin/effect.mio0.o(.data); . = ALIGN(0x10); } _effect_mio0SegmentEnd = ADDR(.effect_mio0) + SIZEOF(.effect_mio0); _effect_mio0SegmentRomEnd = __romPos + SIZEOF(.effect_mio0); __romPos += SIZEOF(.effect_mio0);
_bbh_segment_7SegmentStart = ADDR(.bbh_segment_7); _bbh_segment_7SegmentRomStart = __romPos; .bbh_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/bbh/leveldata.mio0.o(.data); . = ALIGN(0x10); } _bbh_segment_7SegmentEnd = ADDR(.bbh_segment_7) + SIZEOF(.bbh_segment_7); _bbh_segment_7SegmentRomEnd = __romPos + SIZEOF(.bbh_segment_7); __romPos += SIZEOF(.bbh_segment_7); _bbhSegmentStart = ADDR(.bbh); _bbhSegmentRomStart = __romPos; .bbh (0x0E000000) : AT(__romPos) { build/jp/levels/bbh/script.o(.data); build/jp/levels/bbh/geo.o(.data); } _bbhSegmentEnd = ADDR(.bbh) + SIZEOF(.bbh); _bbhSegmentRomEnd = __romPos + SIZEOF(.bbh); __romPos += SIZEOF(.bbh);
_wf_segment_7SegmentStart = ADDR(.wf_segment_7); _wf_segment_7SegmentRomStart = __romPos; .wf_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/wf/leveldata.mio0.o(.data); . = ALIGN(0x10); } _wf_segment_7SegmentEnd = ADDR(.wf_segment_7) + SIZEOF(.wf_segment_7); _wf_segment_7SegmentRomEnd = __romPos + SIZEOF(.wf_segment_7); __romPos += SIZEOF(.wf_segment_7); _wfSegmentStart = ADDR(.wf); _wfSegmentRomStart = __romPos; .wf (0x0E000000) : AT(__romPos) { build/jp/levels/wf/script.o(.data); build/jp/levels/wf/geo.o(.data); } _wfSegmentEnd = ADDR(.wf) + SIZEOF(.wf); _wfSegmentRomEnd = __romPos + SIZEOF(.wf); __romPos += SIZEOF(.wf);
_ccm_segment_7SegmentStart = ADDR(.ccm_segment_7); _ccm_segment_7SegmentRomStart = __romPos; .ccm_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/ccm/leveldata.mio0.o(.data); . = ALIGN(0x10); } _ccm_segment_7SegmentEnd = ADDR(.ccm_segment_7) + SIZEOF(.ccm_segment_7); _ccm_segment_7SegmentRomEnd = __romPos + SIZEOF(.ccm_segment_7); __romPos += SIZEOF(.ccm_segment_7); _ccmSegmentStart = ADDR(.ccm); _ccmSegmentRomStart = __romPos; .ccm (0x0E000000) : AT(__romPos) { build/jp/levels/ccm/script.o(.data); build/jp/levels/ccm/geo.o(.data); } _ccmSegmentEnd = ADDR(.ccm) + SIZEOF(.ccm); _ccmSegmentRomEnd = __romPos + SIZEOF(.ccm); __romPos += SIZEOF(.ccm);
_castle_inside_segment_7SegmentStart = ADDR(.castle_inside_segment_7); _castle_inside_segment_7SegmentRomStart = __romPos; .castle_inside_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/castle_inside/leveldata.mio0.o(.data); . = ALIGN(0x10); } _castle_inside_segment_7SegmentEnd = ADDR(.castle_inside_segment_7) + SIZEOF(.castle_inside_segment_7); _castle_inside_segment_7SegmentRomEnd = __romPos + SIZEOF(.castle_inside_segment_7); __romPos += SIZEOF(.castle_inside_segment_7); _castle_insideSegmentStart = ADDR(.castle_inside); _castle_insideSegmentRomStart = __romPos; .castle_inside (0x0E000000) : AT(__romPos) { build/jp/levels/castle_inside/script.o(.data); build/jp/levels/castle_inside/geo.o(.data); } _castle_insideSegmentEnd = ADDR(.castle_inside) + SIZEOF(.castle_inside); _castle_insideSegmentRomEnd = __romPos + SIZEOF(.castle_inside); __romPos += SIZEOF(.castle_inside);
_hmc_segment_7SegmentStart = ADDR(.hmc_segment_7); _hmc_segment_7SegmentRomStart = __romPos; .hmc_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/hmc/leveldata.mio0.o(.data); . = ALIGN(0x10); } _hmc_segment_7SegmentEnd = ADDR(.hmc_segment_7) + SIZEOF(.hmc_segment_7); _hmc_segment_7SegmentRomEnd = __romPos + SIZEOF(.hmc_segment_7); __romPos += SIZEOF(.hmc_segment_7); _hmcSegmentStart = ADDR(.hmc); _hmcSegmentRomStart = __romPos; .hmc (0x0E000000) : AT(__romPos) { build/jp/levels/hmc/script.o(.data); build/jp/levels/hmc/geo.o(.data); } _hmcSegmentEnd = ADDR(.hmc) + SIZEOF(.hmc); _hmcSegmentRomEnd = __romPos + SIZEOF(.hmc); __romPos += SIZEOF(.hmc);
_ssl_segment_7SegmentStart = ADDR(.ssl_segment_7); _ssl_segment_7SegmentRomStart = __romPos; .ssl_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/ssl/leveldata.mio0.o(.data); . = ALIGN(0x10); } _ssl_segment_7SegmentEnd = ADDR(.ssl_segment_7) + SIZEOF(.ssl_segment_7); _ssl_segment_7SegmentRomEnd = __romPos + SIZEOF(.ssl_segment_7); __romPos += SIZEOF(.ssl_segment_7); _sslSegmentStart = ADDR(.ssl); _sslSegmentRomStart = __romPos; .ssl (0x0E000000) : AT(__romPos) { build/jp/levels/ssl/script.o(.data); build/jp/levels/ssl/geo.o(.data); } _sslSegmentEnd = ADDR(.ssl) + SIZEOF(.ssl); _sslSegmentRomEnd = __romPos + SIZEOF(.ssl); __romPos += SIZEOF(.ssl);
_bob_segment_7SegmentStart = ADDR(.bob_segment_7); _bob_segment_7SegmentRomStart = __romPos; .bob_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/bob/leveldata.mio0.o(.data); . = ALIGN(0x10); } _bob_segment_7SegmentEnd = ADDR(.bob_segment_7) + SIZEOF(.bob_segment_7); _bob_segment_7SegmentRomEnd = __romPos + SIZEOF(.bob_segment_7); __romPos += SIZEOF(.bob_segment_7); _bobSegmentStart = ADDR(.bob); _bobSegmentRomStart = __romPos; .bob (0x0E000000) : AT(__romPos) { build/jp/levels/bob/script.o(.data); build/jp/levels/bob/geo.o(.data); } _bobSegmentEnd = ADDR(.bob) + SIZEOF(.bob); _bobSegmentRomEnd = __romPos + SIZEOF(.bob); __romPos += SIZEOF(.bob);
_sl_segment_7SegmentStart = ADDR(.sl_segment_7); _sl_segment_7SegmentRomStart = __romPos; .sl_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/sl/leveldata.mio0.o(.data); . = ALIGN(0x10); } _sl_segment_7SegmentEnd = ADDR(.sl_segment_7) + SIZEOF(.sl_segment_7); _sl_segment_7SegmentRomEnd = __romPos + SIZEOF(.sl_segment_7); __romPos += SIZEOF(.sl_segment_7); _slSegmentStart = ADDR(.sl); _slSegmentRomStart = __romPos; .sl (0x0E000000) : AT(__romPos) { build/jp/levels/sl/script.o(.data); build/jp/levels/sl/geo.o(.data); } _slSegmentEnd = ADDR(.sl) + SIZEOF(.sl); _slSegmentRomEnd = __romPos + SIZEOF(.sl); __romPos += SIZEOF(.sl);
_wdw_segment_7SegmentStart = ADDR(.wdw_segment_7); _wdw_segment_7SegmentRomStart = __romPos; .wdw_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/wdw/leveldata.mio0.o(.data); . = ALIGN(0x10); } _wdw_segment_7SegmentEnd = ADDR(.wdw_segment_7) + SIZEOF(.wdw_segment_7); _wdw_segment_7SegmentRomEnd = __romPos + SIZEOF(.wdw_segment_7); __romPos += SIZEOF(.wdw_segment_7); _wdwSegmentStart = ADDR(.wdw); _wdwSegmentRomStart = __romPos; .wdw (0x0E000000) : AT(__romPos) { build/jp/levels/wdw/script.o(.data); build/jp/levels/wdw/geo.o(.data); } _wdwSegmentEnd = ADDR(.wdw) + SIZEOF(.wdw); _wdwSegmentRomEnd = __romPos + SIZEOF(.wdw); __romPos += SIZEOF(.wdw);
_jrb_segment_7SegmentStart = ADDR(.jrb_segment_7); _jrb_segment_7SegmentRomStart = __romPos; .jrb_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/jrb/leveldata.mio0.o(.data); . = ALIGN(0x10); } _jrb_segment_7SegmentEnd = ADDR(.jrb_segment_7) + SIZEOF(.jrb_segment_7); _jrb_segment_7SegmentRomEnd = __romPos + SIZEOF(.jrb_segment_7); __romPos += SIZEOF(.jrb_segment_7); _jrbSegmentStart = ADDR(.jrb); _jrbSegmentRomStart = __romPos; .jrb (0x0E000000) : AT(__romPos) { build/jp/levels/jrb/script.o(.data); build/jp/levels/jrb/geo.o(.data); } _jrbSegmentEnd = ADDR(.jrb) + SIZEOF(.jrb); _jrbSegmentRomEnd = __romPos + SIZEOF(.jrb); __romPos += SIZEOF(.jrb);
_thi_segment_7SegmentStart = ADDR(.thi_segment_7); _thi_segment_7SegmentRomStart = __romPos; .thi_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/thi/leveldata.mio0.o(.data); . = ALIGN(0x10); } _thi_segment_7SegmentEnd = ADDR(.thi_segment_7) + SIZEOF(.thi_segment_7); _thi_segment_7SegmentRomEnd = __romPos + SIZEOF(.thi_segment_7); __romPos += SIZEOF(.thi_segment_7); _thiSegmentStart = ADDR(.thi); _thiSegmentRomStart = __romPos; .thi (0x0E000000) : AT(__romPos) { build/jp/levels/thi/script.o(.data); build/jp/levels/thi/geo.o(.data); } _thiSegmentEnd = ADDR(.thi) + SIZEOF(.thi); _thiSegmentRomEnd = __romPos + SIZEOF(.thi); __romPos += SIZEOF(.thi);
_ttc_segment_7SegmentStart = ADDR(.ttc_segment_7); _ttc_segment_7SegmentRomStart = __romPos; .ttc_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/ttc/leveldata.mio0.o(.data); . = ALIGN(0x10); } _ttc_segment_7SegmentEnd = ADDR(.ttc_segment_7) + SIZEOF(.ttc_segment_7); _ttc_segment_7SegmentRomEnd = __romPos + SIZEOF(.ttc_segment_7); __romPos += SIZEOF(.ttc_segment_7); _ttcSegmentStart = ADDR(.ttc); _ttcSegmentRomStart = __romPos; .ttc (0x0E000000) : AT(__romPos) { build/jp/levels/ttc/script.o(.data); build/jp/levels/ttc/geo.o(.data); } _ttcSegmentEnd = ADDR(.ttc) + SIZEOF(.ttc); _ttcSegmentRomEnd = __romPos + SIZEOF(.ttc); __romPos += SIZEOF(.ttc);
_rr_segment_7SegmentStart = ADDR(.rr_segment_7); _rr_segment_7SegmentRomStart = __romPos; .rr_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/rr/leveldata.mio0.o(.data); . = ALIGN(0x10); } _rr_segment_7SegmentEnd = ADDR(.rr_segment_7) + SIZEOF(.rr_segment_7); _rr_segment_7SegmentRomEnd = __romPos + SIZEOF(.rr_segment_7); __romPos += SIZEOF(.rr_segment_7); _rrSegmentStart = ADDR(.rr); _rrSegmentRomStart = __romPos; .rr (0x0E000000) : AT(__romPos) { build/jp/levels/rr/script.o(.data); build/jp/levels/rr/geo.o(.data); } _rrSegmentEnd = ADDR(.rr) + SIZEOF(.rr); _rrSegmentRomEnd = __romPos + SIZEOF(.rr); __romPos += SIZEOF(.rr);
_castle_grounds_segment_7SegmentStart = ADDR(.castle_grounds_segment_7); _castle_grounds_segment_7SegmentRomStart = __romPos; .castle_grounds_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/castle_grounds/leveldata.mio0.o(.data); . = ALIGN(0x10); } _castle_grounds_segment_7SegmentEnd = ADDR(.castle_grounds_segment_7) + SIZEOF(.castle_grounds_segment_7); _castle_grounds_segment_7SegmentRomEnd = __romPos + SIZEOF(.castle_grounds_segment_7); __romPos += SIZEOF(.castle_grounds_segment_7); _castle_groundsSegmentStart = ADDR(.castle_grounds); _castle_groundsSegmentRomStart = __romPos; .castle_grounds (0x0E000000) : AT(__romPos) { build/jp/levels/castle_grounds/script.o(.data); build/jp/levels/castle_grounds/geo.o(.data); } _castle_groundsSegmentEnd = ADDR(.castle_grounds) + SIZEOF(.castle_grounds); _castle_groundsSegmentRomEnd = __romPos + SIZEOF(.castle_grounds); __romPos += SIZEOF(.castle_grounds);
_bitdw_segment_7SegmentStart = ADDR(.bitdw_segment_7); _bitdw_segment_7SegmentRomStart = __romPos; .bitdw_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/bitdw/leveldata.mio0.o(.data); . = ALIGN(0x10); } _bitdw_segment_7SegmentEnd = ADDR(.bitdw_segment_7) + SIZEOF(.bitdw_segment_7); _bitdw_segment_7SegmentRomEnd = __romPos + SIZEOF(.bitdw_segment_7); __romPos += SIZEOF(.bitdw_segment_7); _bitdwSegmentStart = ADDR(.bitdw); _bitdwSegmentRomStart = __romPos; .bitdw (0x0E000000) : AT(__romPos) { build/jp/levels/bitdw/script.o(.data); build/jp/levels/bitdw/geo.o(.data); } _bitdwSegmentEnd = ADDR(.bitdw) + SIZEOF(.bitdw); _bitdwSegmentRomEnd = __romPos + SIZEOF(.bitdw); __romPos += SIZEOF(.bitdw);
_vcutm_segment_7SegmentStart = ADDR(.vcutm_segment_7); _vcutm_segment_7SegmentRomStart = __romPos; .vcutm_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/vcutm/leveldata.mio0.o(.data); . = ALIGN(0x10); } _vcutm_segment_7SegmentEnd = ADDR(.vcutm_segment_7) + SIZEOF(.vcutm_segment_7); _vcutm_segment_7SegmentRomEnd = __romPos + SIZEOF(.vcutm_segment_7); __romPos += SIZEOF(.vcutm_segment_7); _vcutmSegmentStart = ADDR(.vcutm); _vcutmSegmentRomStart = __romPos; .vcutm (0x0E000000) : AT(__romPos) { build/jp/levels/vcutm/script.o(.data); build/jp/levels/vcutm/geo.o(.data); } _vcutmSegmentEnd = ADDR(.vcutm) + SIZEOF(.vcutm); _vcutmSegmentRomEnd = __romPos + SIZEOF(.vcutm); __romPos += SIZEOF(.vcutm);
_bitfs_segment_7SegmentStart = ADDR(.bitfs_segment_7); _bitfs_segment_7SegmentRomStart = __romPos; .bitfs_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/bitfs/leveldata.mio0.o(.data); . = ALIGN(0x10); } _bitfs_segment_7SegmentEnd = ADDR(.bitfs_segment_7) + SIZEOF(.bitfs_segment_7); _bitfs_segment_7SegmentRomEnd = __romPos + SIZEOF(.bitfs_segment_7); __romPos += SIZEOF(.bitfs_segment_7); _bitfsSegmentStart = ADDR(.bitfs); _bitfsSegmentRomStart = __romPos; .bitfs (0x0E000000) : AT(__romPos) { build/jp/levels/bitfs/script.o(.data); build/jp/levels/bitfs/geo.o(.data); } _bitfsSegmentEnd = ADDR(.bitfs) + SIZEOF(.bitfs); _bitfsSegmentRomEnd = __romPos + SIZEOF(.bitfs); __romPos += SIZEOF(.bitfs);
_sa_segment_7SegmentStart = ADDR(.sa_segment_7); _sa_segment_7SegmentRomStart = __romPos; .sa_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/sa/leveldata.mio0.o(.data); . = ALIGN(0x10); } _sa_segment_7SegmentEnd = ADDR(.sa_segment_7) + SIZEOF(.sa_segment_7); _sa_segment_7SegmentRomEnd = __romPos + SIZEOF(.sa_segment_7); __romPos += SIZEOF(.sa_segment_7); _saSegmentStart = ADDR(.sa); _saSegmentRomStart = __romPos; .sa (0x0E000000) : AT(__romPos) { build/jp/levels/sa/script.o(.data); build/jp/levels/sa/geo.o(.data); } _saSegmentEnd = ADDR(.sa) + SIZEOF(.sa); _saSegmentRomEnd = __romPos + SIZEOF(.sa); __romPos += SIZEOF(.sa);
_bits_segment_7SegmentStart = ADDR(.bits_segment_7); _bits_segment_7SegmentRomStart = __romPos; .bits_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/bits/leveldata.mio0.o(.data); . = ALIGN(0x10); } _bits_segment_7SegmentEnd = ADDR(.bits_segment_7) + SIZEOF(.bits_segment_7); _bits_segment_7SegmentRomEnd = __romPos + SIZEOF(.bits_segment_7); __romPos += SIZEOF(.bits_segment_7); _bitsSegmentStart = ADDR(.bits); _bitsSegmentRomStart = __romPos; .bits (0x0E000000) : AT(__romPos) { build/jp/levels/bits/script.o(.data); build/jp/levels/bits/geo.o(.data); } _bitsSegmentEnd = ADDR(.bits) + SIZEOF(.bits); _bitsSegmentRomEnd = __romPos + SIZEOF(.bits); __romPos += SIZEOF(.bits);
_lll_segment_7SegmentStart = ADDR(.lll_segment_7); _lll_segment_7SegmentRomStart = __romPos; .lll_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/lll/leveldata.mio0.o(.data); . = ALIGN(0x10); } _lll_segment_7SegmentEnd = ADDR(.lll_segment_7) + SIZEOF(.lll_segment_7); _lll_segment_7SegmentRomEnd = __romPos + SIZEOF(.lll_segment_7); __romPos += SIZEOF(.lll_segment_7); _lllSegmentStart = ADDR(.lll); _lllSegmentRomStart = __romPos; .lll (0x0E000000) : AT(__romPos) { build/jp/levels/lll/script.o(.data); build/jp/levels/lll/geo.o(.data); } _lllSegmentEnd = ADDR(.lll) + SIZEOF(.lll); _lllSegmentRomEnd = __romPos + SIZEOF(.lll); __romPos += SIZEOF(.lll);
_ddd_segment_7SegmentStart = ADDR(.ddd_segment_7); _ddd_segment_7SegmentRomStart = __romPos; .ddd_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/ddd/leveldata.mio0.o(.data); . = ALIGN(0x10); } _ddd_segment_7SegmentEnd = ADDR(.ddd_segment_7) + SIZEOF(.ddd_segment_7); _ddd_segment_7SegmentRomEnd = __romPos + SIZEOF(.ddd_segment_7); __romPos += SIZEOF(.ddd_segment_7); _dddSegmentStart = ADDR(.ddd); _dddSegmentRomStart = __romPos; .ddd (0x0E000000) : AT(__romPos) { build/jp/levels/ddd/script.o(.data); build/jp/levels/ddd/geo.o(.data); } _dddSegmentEnd = ADDR(.ddd) + SIZEOF(.ddd); _dddSegmentRomEnd = __romPos + SIZEOF(.ddd); __romPos += SIZEOF(.ddd);
_ending_segment_7SegmentStart = ADDR(.ending_segment_7); _ending_segment_7SegmentRomStart = __romPos; .ending_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/ending/leveldata.mio0.o(.data); . = ALIGN(0x10); } _ending_segment_7SegmentEnd = ADDR(.ending_segment_7) + SIZEOF(.ending_segment_7); _ending_segment_7SegmentRomEnd = __romPos + SIZEOF(.ending_segment_7); __romPos += SIZEOF(.ending_segment_7); _endingSegmentStart = ADDR(.ending); _endingSegmentRomStart = __romPos; .ending (0x0E000000) : AT(__romPos) { build/jp/levels/ending/script.o(.data); build/jp/levels/ending/geo.o(.data); } _endingSegmentEnd = ADDR(.ending) + SIZEOF(.ending); _endingSegmentRomEnd = __romPos + SIZEOF(.ending); __romPos += SIZEOF(.ending);
_castle_courtyard_segment_7SegmentStart = ADDR(.castle_courtyard_segment_7); _castle_courtyard_segment_7SegmentRomStart = __romPos; .castle_courtyard_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/castle_courtyard/leveldata.mio0.o(.data); . = ALIGN(0x10); } _castle_courtyard_segment_7SegmentEnd = ADDR(.castle_courtyard_segment_7) + SIZEOF(.castle_courtyard_segment_7); _castle_courtyard_segment_7SegmentRomEnd = __romPos + SIZEOF(.castle_courtyard_segment_7); __romPos += SIZEOF(.castle_courtyard_segment_7); _castle_courtyardSegmentStart = ADDR(.castle_courtyard); _castle_courtyardSegmentRomStart = __romPos; .castle_courtyard (0x0E000000) : AT(__romPos) { build/jp/levels/castle_courtyard/script.o(.data); build/jp/levels/castle_courtyard/geo.o(.data); } _castle_courtyardSegmentEnd = ADDR(.castle_courtyard) + SIZEOF(.castle_courtyard); _castle_courtyardSegmentRomEnd = __romPos + SIZEOF(.castle_courtyard); __romPos += SIZEOF(.castle_courtyard);
_pss_segment_7SegmentStart = ADDR(.pss_segment_7); _pss_segment_7SegmentRomStart = __romPos; .pss_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/pss/leveldata.mio0.o(.data); . = ALIGN(0x10); } _pss_segment_7SegmentEnd = ADDR(.pss_segment_7) + SIZEOF(.pss_segment_7); _pss_segment_7SegmentRomEnd = __romPos + SIZEOF(.pss_segment_7); __romPos += SIZEOF(.pss_segment_7); _pssSegmentStart = ADDR(.pss); _pssSegmentRomStart = __romPos; .pss (0x0E000000) : AT(__romPos) { build/jp/levels/pss/script.o(.data); build/jp/levels/pss/geo.o(.data); } _pssSegmentEnd = ADDR(.pss) + SIZEOF(.pss); _pssSegmentRomEnd = __romPos + SIZEOF(.pss); __romPos += SIZEOF(.pss);
_cotmc_segment_7SegmentStart = ADDR(.cotmc_segment_7); _cotmc_segment_7SegmentRomStart = __romPos; .cotmc_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/cotmc/leveldata.mio0.o(.data); . = ALIGN(0x10); } _cotmc_segment_7SegmentEnd = ADDR(.cotmc_segment_7) + SIZEOF(.cotmc_segment_7); _cotmc_segment_7SegmentRomEnd = __romPos + SIZEOF(.cotmc_segment_7); __romPos += SIZEOF(.cotmc_segment_7); _cotmcSegmentStart = ADDR(.cotmc); _cotmcSegmentRomStart = __romPos; .cotmc (0x0E000000) : AT(__romPos) { build/jp/levels/cotmc/script.o(.data); build/jp/levels/cotmc/geo.o(.data); } _cotmcSegmentEnd = ADDR(.cotmc) + SIZEOF(.cotmc); _cotmcSegmentRomEnd = __romPos + SIZEOF(.cotmc); __romPos += SIZEOF(.cotmc);
_totwc_segment_7SegmentStart = ADDR(.totwc_segment_7); _totwc_segment_7SegmentRomStart = __romPos; .totwc_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/totwc/leveldata.mio0.o(.data); . = ALIGN(0x10); } _totwc_segment_7SegmentEnd = ADDR(.totwc_segment_7) + SIZEOF(.totwc_segment_7); _totwc_segment_7SegmentRomEnd = __romPos + SIZEOF(.totwc_segment_7); __romPos += SIZEOF(.totwc_segment_7); _totwcSegmentStart = ADDR(.totwc); _totwcSegmentRomStart = __romPos; .totwc (0x0E000000) : AT(__romPos) { build/jp/levels/totwc/script.o(.data); build/jp/levels/totwc/geo.o(.data); } _totwcSegmentEnd = ADDR(.totwc) + SIZEOF(.totwc); _totwcSegmentRomEnd = __romPos + SIZEOF(.totwc); __romPos += SIZEOF(.totwc);
_bowser_1_segment_7SegmentStart = ADDR(.bowser_1_segment_7); _bowser_1_segment_7SegmentRomStart = __romPos; .bowser_1_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/bowser_1/leveldata.mio0.o(.data); . = ALIGN(0x10); } _bowser_1_segment_7SegmentEnd = ADDR(.bowser_1_segment_7) + SIZEOF(.bowser_1_segment_7); _bowser_1_segment_7SegmentRomEnd = __romPos + SIZEOF(.bowser_1_segment_7); __romPos += SIZEOF(.bowser_1_segment_7); _bowser_1SegmentStart = ADDR(.bowser_1); _bowser_1SegmentRomStart = __romPos; .bowser_1 (0x0E000000) : AT(__romPos) { build/jp/levels/bowser_1/script.o(.data); build/jp/levels/bowser_1/geo.o(.data); } _bowser_1SegmentEnd = ADDR(.bowser_1) + SIZEOF(.bowser_1); _bowser_1SegmentRomEnd = __romPos + SIZEOF(.bowser_1); __romPos += SIZEOF(.bowser_1);
_wmotr_segment_7SegmentStart = ADDR(.wmotr_segment_7); _wmotr_segment_7SegmentRomStart = __romPos; .wmotr_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/wmotr/leveldata.mio0.o(.data); . = ALIGN(0x10); } _wmotr_segment_7SegmentEnd = ADDR(.wmotr_segment_7) + SIZEOF(.wmotr_segment_7); _wmotr_segment_7SegmentRomEnd = __romPos + SIZEOF(.wmotr_segment_7); __romPos += SIZEOF(.wmotr_segment_7); _wmotrSegmentStart = ADDR(.wmotr); _wmotrSegmentRomStart = __romPos; .wmotr (0x0E000000) : AT(__romPos) { build/jp/levels/wmotr/script.o(.data); build/jp/levels/wmotr/geo.o(.data); } _wmotrSegmentEnd = ADDR(.wmotr) + SIZEOF(.wmotr); _wmotrSegmentRomEnd = __romPos + SIZEOF(.wmotr); __romPos += SIZEOF(.wmotr);

_bowser_2_segment_7SegmentStart = ADDR(.bowser_2_segment_7); _bowser_2_segment_7SegmentRomStart = __romPos; .bowser_2_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/bowser_2/leveldata.mio0.o(.data); . = ALIGN(0x10); } _bowser_2_segment_7SegmentEnd = ADDR(.bowser_2_segment_7) + SIZEOF(.bowser_2_segment_7); _bowser_2_segment_7SegmentRomEnd = __romPos + SIZEOF(.bowser_2_segment_7); __romPos += SIZEOF(.bowser_2_segment_7); _bowser_2SegmentStart = ADDR(.bowser_2); _bowser_2SegmentRomStart = __romPos; .bowser_2 (0x0E000000) : AT(__romPos) { build/jp/levels/bowser_2/script.o(.data); build/jp/levels/bowser_2/geo.o(.data); } _bowser_2SegmentEnd = ADDR(.bowser_2) + SIZEOF(.bowser_2); _bowser_2SegmentRomEnd = __romPos + SIZEOF(.bowser_2); __romPos += SIZEOF(.bowser_2);
_bowser_3_segment_7SegmentStart = ADDR(.bowser_3_segment_7); _bowser_3_segment_7SegmentRomStart = __romPos; .bowser_3_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/bowser_3/leveldata.mio0.o(.data); . = ALIGN(0x10); } _bowser_3_segment_7SegmentEnd = ADDR(.bowser_3_segment_7) + SIZEOF(.bowser_3_segment_7); _bowser_3_segment_7SegmentRomEnd = __romPos + SIZEOF(.bowser_3_segment_7); __romPos += SIZEOF(.bowser_3_segment_7); _bowser_3SegmentStart = ADDR(.bowser_3); _bowser_3SegmentRomStart = __romPos; .bowser_3 (0x0E000000) : AT(__romPos) { build/jp/levels/bowser_3/script.o(.data); build/jp/levels/bowser_3/geo.o(.data); } _bowser_3SegmentEnd = ADDR(.bowser_3) + SIZEOF(.bowser_3); _bowser_3SegmentRomEnd = __romPos + SIZEOF(.bowser_3); __romPos += SIZEOF(.bowser_3);

_ttm_segment_7SegmentStart = ADDR(.ttm_segment_7); _ttm_segment_7SegmentRomStart = __romPos; .ttm_segment_7 (0x07000000) : AT(__romPos) { build/jp/levels/ttm/leveldata.mio0.o(.data); . = ALIGN(0x10); } _ttm_segment_7SegmentEnd = ADDR(.ttm_segment_7) + SIZEOF(.ttm_segment_7); _ttm_segment_7SegmentRomEnd = __romPos + SIZEOF(.ttm_segment_7); __romPos += SIZEOF(.ttm_segment_7); _ttmSegmentStart = ADDR(.ttm); _ttmSegmentRomStart = __romPos; .ttm (0x0E000000) : AT(__romPos) { build/jp/levels/ttm/script.o(.data); build/jp/levels/ttm/geo.o(.data); } _ttmSegmentEnd = ADDR(.ttm) + SIZEOF(.ttm); _ttmSegmentRomEnd = __romPos + SIZEOF(.ttm); __romPos += SIZEOF(.ttm);


    _assetsSegmentStart = ADDR(.assets); _assetsSegmentRomStart = __romPos; .assets (__romPos) : AT(__romPos)
    {
        build/jp/assets/mario_anim_data.o(.data);
        build/jp/assets/mario_anim_data.o(.rodata);
        build/jp/assets/demo_data.o(.data);
        build/jp/sound/sound_data.o(.data);
    }
    _assetsSegmentEnd = ADDR(.assets) + SIZEOF(.assets); _assetsSegmentRomEnd = __romPos + SIZEOF(.assets); __romPos += SIZEOF(.assets);
    /DISCARD/ :
    {
        *(*);
    }
    ASSERT((_goddardSegmentNoloadEnd <= 0x80800000), "Error: menu segment extended past pool end")
    ASSERT((_mainSegmentNoloadEnd <= _engineSegmentStart), "Error: main segment extended into engine.")
    ASSERT((_engineSegmentNoloadEnd <= _framebuffersSegmentNoloadStart), "Error: engine segment extended into framebuffers.")
    ASSERT((_framebuffersSegmentNoloadEnd <= 0x80800000), "Error: framebuffers segment extended past RDRAM end")
}
