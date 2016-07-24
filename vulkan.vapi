/* Vulkan 1.0.22 Vala Bindings
 * Copyright 2016 Guillaume Poirier-Morency <guillaumepoiriermorency@gmail>
 *
** Copyright (c) 2015-2016 The Khronos Group Inc.
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file ecept in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either epress or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/

[CCode (cprefix = "Vk", clower_prefix = "vk_", cheader_filename = "vulkan.h")]
namespace Vulkan
{
	public const int VERSION_1_0;

	[Version (deprecated = true)]
	public const int API_VERSION;

	// Vulkan 1.0 version number
	public const int API_VERSION_1_0;

	public const int VERSION_MAJOR;
	public const int VERSION_MINOR;
	public const int VERSION_PATCH;
		// Version of this file
	public const int HEADER_VERSION;

	public const int NULL_HANDLE;

	[CCode (has_type_id = false)]
	[SimpleType]
	public struct DeviceSize : uint64 {}

	[CCode (has_type_id = false)]
	[SimpleType]
	public struct SampleMask : uint32 {}

	public Result CreateInstance (InstanceCreateInfo pCreateInfo, AllocationCallbacks pAllocator, out Instance pInstance);

	[CCode (cprefix = "vk", has_type_id = false)]
	public struct Instance
	{
		public Result EnumeratePhysicalDevices ([CCode (array_length_pos = 0.9)] out PhysicalDevice[] pPhysicalDevices);
		public void GetInstanceProcAddr (string pName);
		public void DestroyInstance (AllocationCallbacks pAllocator);
		public Result CreateDebugReportCallbackEXT (DebugReportCallbackCreateInfoEXT pCreateInfo, AllocationCallbacks pAllocator, DebugReportCallbackEXT pCallback);
		public void DestroyDebugReportCallbackEXT (DebugReportCallbackEXT callback, AllocationCallbacks pAllocator);
		public void DebugReportMessageEXT (DebugReportFlagsEXT flags, DebugReportObjectTypeEXT objectType, uint64 object, size_t location, int32 messageCode, string pLayerPrefi, string pMessage);
		public Result CreateDisplayPlaneSurfaceKHR(DisplaySurfaceCreateInfoKHR* pCreateInfo, AllocationCallbacks pAllocator, SurfaceKHR* pSurface);
	}

	[CCode (cprefix = "vk", has_type_id = false)]
	public struct PhysicalDevice {
		public Result EnumerateDeviceEtensionProperties( string pLayerName, uint32* pPropertyCount, EtensionProperties* pProperties);
		public Result EnumerateDeviceLayerProperties( uint32* pPropertyCount, LayerProperties* pProperties);
		public void GetPhysicalDeviceSparseImageFormatProperties ( Format format, ImageType type, SampleCountFlags samples, ImageUsageFlags usage, ImageTiling tiling, [CCode (array_length_pos =  "5.1")] out SparseImageFormatProperties[] pProperties);
		public Result CreateDevice (DeviceCreateInfo* pCreateInfo, AllocationCallbacks pAllocator, out Device pDevice);
		public void GetPhysicalDeviceFeatures (PhysicalDeviceFeatures pFeatures);
		public void GetPhysicalDeviceFormatProperties (Format format, FormatProperties pFormatProperties);
		public Result GetPhysicalDeviceImageFormatProperties( Format format, ImageType type, ImageTiling tiling, ImageUsageFlags usage, ImageCreateFlags flags, ImageFormatProperties pImageFormatProperties);
		public void GetPhysicalDeviceProperties( PhysicalDeviceProperties* pProperties);
		public void GetPhysicalDeviceQueueFamilyProperties ([CCode (array_length_pos = 0.9)] out QueueFamilyProperties[] pQueueFamilyProperties);
		public void GetPhysicalDeviceMemoryProperties([CCode (array_length_pos = 0.9)] out PhysicalDeviceMemoryProperties[] pMemoryProperties);
		public Result GetPhysicalDeviceSurfaceSupportKHR( uint32 queueFamilyInde, SurfaceKHR surface, out bool pSupported);
		public Result GetPhysicalDeviceSurfaceCapabilitiesKHR( SurfaceKHR surface, SurfaceCapabilitiesKHR* pSurfaceCapabilities);
		public Result GetPhysicalDeviceSurfaceFormatsKHR( SurfaceKHR surface, [CCode (array_length_cname = "pSurfaceFormatCount")] SurfaceFormatKHR[] pSurfaceFormats);
		public Result GetPhysicalDeviceSurfacePresentModesKHR( SurfaceKHR surface, [CCode (array_length_cname = "pPresentModeCount")] PresentModeKHR[] pPresentModes);
		public Result GetPhysicalDeviceDisplayPropertiesKHR(uint32* pPropertyCount, DisplayPropertiesKHR* pProperties);
		public Result GetPhysicalDeviceDisplayPlanePropertiesKHR([CCode (array_length_pos = "0.9")] out DisplayPlanePropertiesKHR[] pProperties);
		public Result GetDisplayPlaneSupportedDisplaysKHR(uint32 planeInde, uint32* pDisplayCount, DisplayKHR* pDisplays);
		public Result GetDisplayModePropertiesKHR(DisplayKHR display, [CCode (array_length_pos = "1.9")] out DisplayModePropertiesKHR[] pProperties);
		public Result CreateDisplayModeKHR(DisplayKHR display, DisplayModeCreateInfoKHR pCreateInfo, AllocationCallbacks pAllocator, out DisplayModeKHR pMode);
		public Result GetDisplayPlaneCapabilitiesKHR(DisplayModeKHR mode, uint32 planeInde, DisplayPlaneCapabilitiesKHR* pCapabilities);
	}

	[CCode (cprefix = "vk", has_type_id = false)]
	public struct Device
	{
		public void GetDeviceProcAddr (string pName);
		public void GetDeviceQueue( uint32 queueFamilyInde, uint32 queueInde, Queue* pQueue);
		public Result AllocateMemory(MemoryAllocateInfo  pAllocateInfo, AllocationCallbacks pAllocator, DeviceMemory pMemory);
		public void FreeMemory(DeviceMemory memory, AllocationCallbacks pAllocator);
		public Result MapMemory(DeviceMemory memory, DeviceSize offset, DeviceSize size, MemoryMapFlags flags, void** ppData);
		public void UnmapMemory(DeviceMemory memory);
		public Result FlushMappedMemoryRanges (uint32 memoryRangeCount, MappedMemoryRange* pMemoryRanges);
		public Result InvalidateMappedMemoryRanges ([CCode (array_length_pos = "0.9")] MappedMemoryRange[] pMemoryRanges);
		public void GetDeviceMemoryCommitment (DeviceMemory memory, out DeviceSize pCommittedMemoryInBytes);
		public Result BindBufferMemory( Buffer buffer, DeviceMemory memory, DeviceSize memoryOffset);
		public Result BindImageMemory( Image image, DeviceMemory memory, DeviceSize memoryOffset);
		public void GetBufferMemoryRequirements( Buffer buffer, out MemoryRequirements pMemoryRequirements);
		public void GetImageMemoryRequirements( Image image, out MemoryRequirements pMemoryRequirements);
		public void GetImageSparseMemoryRequirements (Image image, [CCode (array_length_pos = "1.9")] out SparseImageMemoryRequirements[] pSparseMemoryRequirements);
		public Result DeviceWaitIdle ();
		public Result CreateFence( FenceCreateInfo pCreateInfo, AllocationCallbacks pAllocator, out Fence pFence);
		public void DestroyFence (Fence fence, AllocationCallbacks pAllocator);
		public Result ResetFences ([CCode (array_length_pos = "0.9")] Fence pFences);
		public Result GetFenceStatus ( Fence fence);
		public Result WaitForFences ([CCode (array_length_pos = "0.9")] Fence[] pFences, bool waitAll, uint64 timeout);
		public Result CreateSemaphore (SemaphoreCreateInfo pCreateInfo, AllocationCallbacks pAllocator, out Semaphore pSemaphore);
		public void DestroySemaphore( Semaphore                                 semaphore, AllocationCallbacks                pAllocator);
		public Result CreateEvent( EventCreateInfo* pCreateInfo, AllocationCallbacks pAllocator, out Event pEvent);
		public void DestroyEvent( Event                                     event, AllocationCallbacks                pAllocator);
		public Result GetEventStatus( Event                                     event);
		public Result SetEvent( Event                                     event);
		public Result ResetEvent( Event                                     event);
		public Result CreateQueryPool( QueryPoolCreateInfo*                pCreateInfo, AllocationCallbacks                pAllocator, QueryPool*                                pQueryPool);
		public void DestroyQueryPool( QueryPool                                 queryPool, AllocationCallbacks                pAllocator);
		public Result GetQueryPoolResults( QueryPool                                 queryPool, uint32                                    firstQuery, uint32                                    queryCount, size_t                                      dataSize, void*                                       pData, DeviceSize                                stride, QueryResultFlags                          flags);
		public Result CreateBuffer( BufferCreateInfo*                   pCreateInfo, AllocationCallbacks                pAllocator, Buffer*                                   pBuffer);
		public void DestroyBuffer( Buffer                                    buffer, AllocationCallbacks                pAllocator);
		public Result CreateBufferView( BufferViewCreateInfo*               pCreateInfo, AllocationCallbacks                pAllocator, BufferView*                               pView);
		public void DestroyBufferView( BufferView                                bufferView, AllocationCallbacks                pAllocator);
		public Result CreateImage( ImageCreateInfo*                    pCreateInfo, AllocationCallbacks                pAllocator, Image*                                    pImage);
		public void DestroyImage( Image                                     image, AllocationCallbacks                pAllocator);
		public void GetImageSubresourceLayout( Image                                     image, ImageSubresource*                   pSubresource, SubresourceLayout*                        pLayout);
		public Result CreateImageView( ImageViewCreateInfo*                pCreateInfo, AllocationCallbacks                pAllocator, ImageView*                                pView);
		public void DestroyImageView( ImageView                                 imageView, AllocationCallbacks                pAllocator);
		public Result CreateShaderModule( ShaderModuleCreateInfo*             pCreateInfo, AllocationCallbacks                pAllocator, ShaderModule*                             pShaderModule);
		public void DestroyShaderModule( ShaderModule                              shaderModule, AllocationCallbacks                pAllocator);
		public Result CreatePipelineCache( PipelineCacheCreateInfo*            pCreateInfo, AllocationCallbacks                pAllocator, PipelineCache*                            pPipelineCache);
		public void DestroyPipelineCache( PipelineCache                             pipelineCache, AllocationCallbacks                pAllocator);
		public Result GetPipelineCacheData( PipelineCache                             pipelineCache, size_t*                                     pDataSize, void*                                       pData);
		public Result MergePipelineCaches( PipelineCache                             dstCache, uint32                                    srcCacheCount, PipelineCache*                      pSrcCaches);
		public Result CreateGraphicsPipelines( PipelineCache                             pipelineCache, uint32                                    createInfoCount, GraphicsPipelineCreateInfo*         pCreateInfos, AllocationCallbacks                pAllocator, Pipeline*                                 pPipelines);
		public Result CreateComputePipelines( PipelineCache                             pipelineCache, uint32                                    createInfoCount, ComputePipelineCreateInfo*          pCreateInfos, AllocationCallbacks                pAllocator, Pipeline*                                 pPipelines);
		public void DestroyPipeline( Pipeline                                  pipeline, AllocationCallbacks                pAllocator);
		public Result CreatePipelineLayout( PipelineLayoutCreateInfo*           pCreateInfo, AllocationCallbacks                pAllocator, PipelineLayout*                           pPipelineLayout);
		public void DestroyPipelineLayout( PipelineLayout                            pipelineLayout, AllocationCallbacks                pAllocator);
		public Result CreateSampler( SamplerCreateInfo*                  pCreateInfo, AllocationCallbacks                pAllocator, Sampler*                                  pSampler);
		public void DestroySampler( Sampler                                   sampler, AllocationCallbacks                pAllocator);
		public Result CreateDescriptorSetLayout( DescriptorSetLayoutCreateInfo*      pCreateInfo, AllocationCallbacks                pAllocator, DescriptorSetLayout*                      pSetLayout);
		public void DestroyDescriptorSetLayout( DescriptorSetLayout                       descriptorSetLayout, AllocationCallbacks                pAllocator);
		public Result CreateDescriptorPool( DescriptorPoolCreateInfo*           pCreateInfo, AllocationCallbacks                pAllocator, DescriptorPool*                           pDescriptorPool);
		public void DestroyDescriptorPool( DescriptorPool                            descriptorPool, AllocationCallbacks                pAllocator);
		public Result ResetDescriptorPool( DescriptorPool                            descriptorPool, DescriptorPoolResetFlags                  flags);
		public Result AllocateDescriptorSets( DescriptorSetAllocateInfo*          pAllocateInfo, DescriptorSet*                            pDescriptorSets);
		public Result FreeDescriptorSets( DescriptorPool                            descriptorPool, uint32                                    descriptorSetCount, DescriptorSet*                      pDescriptorSets);
		public void UpdateDescriptorSets( uint32                                    descriptorWriteCount, WriteDescriptorSet*                 pDescriptorWrites, uint32                                    descriptorCopyCount, CopyDescriptorSet*                  pDescriptorCopies);
		public Result CreateFramebuffer( FramebufferCreateInfo*              pCreateInfo, AllocationCallbacks                pAllocator, Framebuffer*                              pFramebuffer);
		public void DestroyFramebuffer( Framebuffer                               framebuffer, AllocationCallbacks                pAllocator);
		public Result CreateRenderPass( RenderPassCreateInfo*               pCreateInfo, AllocationCallbacks                pAllocator, RenderPass*                               pRenderPass);
		public void DestroyRenderPass( RenderPass                                renderPass, AllocationCallbacks                pAllocator);
		public void GetRenderAreaGranularity( RenderPass                                renderPass, Etent2D*                                 pGranularity);
		public Result CreateCommandPool( CommandPoolCreateInfo*              pCreateInfo, AllocationCallbacks                pAllocator, CommandPool*                              pCommandPool);
		public void DestroyCommandPool( CommandPool                               commandPool, AllocationCallbacks                pAllocator);
		public Result ResetCommandPool( CommandPool commandPool, CommandPoolResetFlags flags);
		public Result AllocateCommandBuffers( CommandBufferAllocateInfo*          pAllocateInfo, CommandBuffer*                            pCommandBuffers);
		public void FreeCommandBuffers(CommandPool commandPool, uint32 commandBufferCount, [CCode (array_length_pos = "1.9")] CommandBuffer[] pCommandBuffers);
		public void DestroyDevice (AllocationCallbacks pAllocator);
		public static Result EnumerateInstanceEtensionProperties (string pLayerName, [CCode (array_length_pos = "1.1")] out EtensionProperties[] pProperties);
		public static Result EnumerateInstanceLayerProperties ([CCode (array_length_pos = "1.1")] out LayerProperties[] pProperties);
		public Result DebugMarkerSetObjectTagEXT( DebugMarkerObjectTagInfoEXT* pTagInfo);
		public Result DebugMarkerSetObjectNameEXT( DebugMarkerObjectNameInfoEXT* pNameInfo);
	}

	[CCode (cprefix = "vk", has_type_id = false)]
	public struct Queue
	{
		public Result QueueSubmit ([CCode (array_len_pos = "0.9")] SubmitInfo[] pSubmits, Fence fence);
		public Result QueueWaitIdle ();
		public Result QueueBindSparse( [CCode (array_length_pos = 0.9)] BindSparseInfo[]                     pBindInfo, Fence                                     fence);
	}

	[CCode (has_type_id = false)]
	public struct Semaphore {}

	[CCode (cprefix = "vk", has_type_id = false)]
	public struct CommandBuffer {
		public Result BeginCommandBuffer( CommandBufferBeginInfo*             pBeginInfo);
		public Result EndCommandBuffer ();
		public Result ResetCommandBuffer( CommandBufferResetFlags                   flags);
		public void CmdBindPipeline( PipelineBindPoint                         pipelineBindPoint, Pipeline                                  pipeline);
		public void CmdSetViewport( uint32                                    firstViewport, uint32                                    viewportCount, Viewport*                           pViewports);
		public void CmdSetScissor( uint32                                    firstScissor, uint32                                    scissorCount, Rect2D*                             pScissors);
		public void CmdSetLineWidth( float                                       lineWidth);
		public void CmdSetDepthBias( float                                       depthBiasConstantFactor, float                                       depthBiasClamp, float                                       depthBiasSlopeFactor);
		public void CmdSetBlendConstants( float                                 blendConstants[4]);
		public void CmdSetDepthBounds( float                                       minDepthBounds, float                                       maDepthBounds);
		public void CmdSetStencilCompareMask( StencilFaceFlags                          faceMask, uint32                                    compareMask);
		public void CmdSetStencilWriteMask( StencilFaceFlags                          faceMask, uint32                                    writeMask);
		public void CmdSetStencilReference( StencilFaceFlags                          faceMask, uint32                                    reference);
		public void CmdBindDescriptorSets( PipelineBindPoint                         pipelineBindPoint, PipelineLayout                            layout, uint32                                    firstSet, uint32                                    descriptorSetCount, DescriptorSet*                      pDescriptorSets, uint32                                    dynamicOffsetCount, uint32*                             pDynamicOffsets);
		public void CmdBindIndeBuffer( Buffer                                    buffer, DeviceSize                                offset, IndeType                                 indeType);
		public void CmdBindVerteBuffers( uint32                                    firstBinding, uint32                                    bindingCount, Buffer*                             pBuffers, DeviceSize*                         pOffsets);
		public void CmdDraw( uint32                                    verteCount, uint32                                    instanceCount, uint32                                    firstVerte, uint32                                    firstInstance);
		public void CmdDrawIndeed( uint32                                    indeCount, uint32                                    instanceCount, uint32                                    firstInde, int32                                     verteOffset, uint32                                    firstInstance);
		public void CmdDrawIndirect( Buffer                                    buffer, DeviceSize                                offset, uint32                                    drawCount, uint32                                    stride);
		public void CmdDrawIndeedIndirect( Buffer                                    buffer, DeviceSize                                offset, uint32                                    drawCount, uint32                                    stride);
		public void CmdDispatch( uint32 x , uint32 y, uint32 z);
		public void CmdDispatchIndirect( Buffer                                    buffer, DeviceSize                                offset);
		public void CmdCopyBuffer( Buffer                                    srcBuffer, Buffer                                    dstBuffer, uint32                                    regionCount, BufferCopy*                         pRegions);
		public void CmdCopyImage( Image                                     srcImage, ImageLayout                               srcImageLayout, Image                                     dstImage, ImageLayout                               dstImageLayout, uint32                                    regionCount, ImageCopy*                          pRegions);
		public void CmdBlitImage( Image                                     srcImage, ImageLayout                               srcImageLayout, Image                                     dstImage, ImageLayout                               dstImageLayout, uint32                                    regionCount, ImageBlit*                          pRegions, Filter                                    filter);
		public void CmdCopyBufferToImage( Buffer                                    srcBuffer, Image                                     dstImage, ImageLayout                               dstImageLayout, uint32                                    regionCount, BufferImageCopy*                    pRegions);
		public void CmdCopyImageToBuffer( Image                                     srcImage, ImageLayout                               srcImageLayout, Buffer                                    dstBuffer, uint32                                    regionCount, BufferImageCopy*                    pRegions);
		public void CmdUpdateBuffer( Buffer                                    dstBuffer, DeviceSize                                dstOffset, DeviceSize                                dataSize, void*                                 pData);
		public void CmdFillBuffer( Buffer                                    dstBuffer, DeviceSize                                dstOffset, DeviceSize                                size, uint32                                    data);
		public void CmdClearColorImage( Image                                     image, ImageLayout                               imageLayout, ClearColorValue*                    pColor, uint32                                    rangeCount, ImageSubresourceRange*              pRanges);
		public void CmdClearDepthStencilImage( Image                                     image, ImageLayout                               imageLayout, ClearDepthStencilValue*             pDepthStencil, uint32                                    rangeCount, ImageSubresourceRange*              pRanges);
		public void CmdClearAttachments( uint32                                    attachmentCount, ClearAttachment*                    pAttachments, uint32                                    rectCount, ClearRect*                          pRects);
		public void CmdResolveImage( Image                                     srcImage, ImageLayout                               srcImageLayout, Image                                     dstImage, ImageLayout                               dstImageLayout, uint32                                    regionCount, ImageResolve*                       pRegions);
		public void CmdSetEvent( Event                                     event, PipelineStageFlags                        stageMask);
		public void CmdResetEvent( Event                                     event, PipelineStageFlags                        stageMask);
		public void CmdWaitEvents( uint32 eventCount, Event* pEvents, PipelineStageFlags srcStageMask, PipelineStageFlags dstStageMask, uint32 memoryBarrierCount, MemoryBarrier* pMemoryBarriers, uint32 bufferMemoryBarrierCount, BufferMemoryBarrier* pBufferMemoryBarriers, uint32 imageMemoryBarrierCount, ImageMemoryBarrier* pImageMemoryBarriers);
		public void CmdPipelineBarrier( PipelineStageFlags srcStageMask, PipelineStageFlags dstStageMask, DependencyFlags dependencyFlags, uint32 memoryBarrierCount, MemoryBarrier* pMemoryBarriers, uint32 bufferMemoryBarrierCount, BufferMemoryBarrier* pBufferMemoryBarriers, uint32 imageMemoryBarrierCount, ImageMemoryBarrier* pImageMemoryBarriers);
		public void CmdBeginQuery( QueryPool queryPool, uint32 query, QueryControlFlags flags);
		public void CmdEndQuery( QueryPool queryPool, uint32 query);
		public void CmdResetQueryPool( QueryPool queryPool, uint32 firstQuery, uint32 queryCount);
		public void CmdWriteTimestamp( PipelineStageFlags pipelineStage, QueryPool queryPool, uint32 query);
		public void CmdCopyQueryPoolResults( QueryPool queryPool, uint32 firstQuery, uint32 queryCount, Buffer dstBuffer, DeviceSize dstOffset, DeviceSize stride, QueryResultFlags flags);
		public void CmdPushConstants( PipelineLayout layout, ShaderStageFlags stageFlags, uint32 offset, uint32 size, void* pValues);
		public void CmdBeginRenderPass( RenderPassBeginInfo* pRenderPassBegin, SubpassContents contents);
		public void CmdNetSubpass( SubpassContents contents);
		public void CmdEndRenderPass();
		public void CmdEecuteCommands( [CCode (array_length_pos = 0.9)] CommandBuffer[]                     pCommandBuffers);
		public void CmdDebugMarkerBeginEXT( DebugMarkerMarkerInfoEXT*                 pMarkerInfo);
		public void CmdDebugMarkerEndEXT( );
		public void CmdDebugMarkerInsertEXT( DebugMarkerMarkerInfoEXT                 pMarkerInfo);
	}

	[CCode (has_type_id = false)]
	public struct Fence {}
	[CCode (has_type_id = false)]
	public struct DeviceMemory {}
	[CCode (has_type_id = false)]
	public struct Buffer {}
	[CCode (has_type_id = false)]
	public struct Image {}
	[CCode (has_type_id = false)]
	public struct Event {}
	[CCode (has_type_id = false)]
	public struct QueryPool {}
	[CCode (has_type_id = false)]
	public struct BufferView {}
	[CCode (has_type_id = false)]
	public struct ImageView {}
	[CCode (has_type_id = false)]
	public struct ShaderModule {}
	[CCode (has_type_id = false)]
	public struct PipelineCache {}
	[CCode (has_type_id = false)]
	public struct PipelineLayout {}
	[CCode (has_type_id = false)]
	public struct RenderPass {}
	[CCode (has_type_id = false)]
	public struct Pipeline {}
	[CCode (has_type_id = false)]
	public struct DescriptorSetLayout {}
	[CCode (has_type_id = false)]
	public struct Sampler {}
	[CCode (has_type_id = false)]
	public struct DescriptorPool {}
	[CCode (has_type_id = false)]
	public struct DescriptorSet {}
	[CCode (has_type_id = false)]
	public struct Framebuffer {}
	[CCode (has_type_id = false)]
	public struct CommandPool {}

	public const float _LOD_CLAMP_NONE;
	/*
	public const REMAINING_MIP_LEVELS             (~0U);
	public const REMAINING_ARRAY_LAYERS           (~0U);
	public const WHOLE_SIZE                       (~0ULL);
	public const ATTACHMENT_UNUSED                (~0U);
	public const QUEUE_FAMILY_IGNORED             (~0U);
	public const SUBPASS_EXTERNAL                 (~0U);
	*/
	public const int MAX_PHYSICAL_DEVICE_NAME_SIZE;
	public const int UUID_SIZE;
	public const int MAX_MEMORY_TYPES;
	public const int MAX_MEMORY_HEAPS;
	public const int MAX_EXTENSION_NAME_SIZE;
	public const int MAX_DESCRIPTION_SIZE;

	public enum PipelineCacheHeaderVersion
	{
		ONE
	}

	public enum Result
	{
		SUCCESS,
		NOT_READY,
		TIMEOUT,
		EVENT_SET,
		EVENT_RESET,
		INCOMPLETE,
		ERROR_OUT_OF_HOST_MEMORY,
		ERROR_OUT_OF_DEVICE_MEMORY,
		ERROR_INITIALIZATION_FAILED,
		ERROR_DEVICE_LOST,
		ERROR_MEMORY_MAP_FAILED,
		ERROR_LAYER_NOT_PRESENT,
		ERROR_EXTENSION_NOT_PRESENT,
		ERROR_FEATURE_NOT_PRESENT,
		ERROR_INCOMPATIBLE_DRIVER,
		ERROR_TOO_MANY_OBJECTS0,
		ERROR_FORMAT_NOT_SUPPORTED,
		ERROR_FRAGMENTED_POOL,
		ERROR_SURFACE_LOST_KHR,
		ERROR_NATIVE_WINDOW_IN_USE_KHR,
		SUBOPTIMAL_KHR,
		ERROR_OUT_OF_DATE_KHR,
		ERROR_INCOMPATIBLE_DISPLAY_KHR,
		ERROR_VALIDATION_FAILED_EXT,
		ERROR_INVALID_SHADER_NV
	}

	public enum StructureType
	{
		APPLICATION_INFO,
		INSTANCE_CREATE_INFO,
		DEVICE_QUEUE_CREATE_INFO,
		DEVICE_CREATE_INFO,
		SUBMIT_INFO,
		MEMORY_ALLOCATE_INFO,
		MAPPED_MEMORY_RANGE,
		BIND_SPARSE_INFO,
		FENCE_CREATE_INFO,
		SEMAPHORE_CREATE_INFO,
		EVENT_CREATE_INFO,
		QUERY_POOL_CREATE_INFO,
		BUFFER_CREATE_INFO,
		BUFFER_VIEW_CREATE_INFO,
		IMAGE_CREATE_INFO,
		IMAGE_VIEW_CREATE_INFO,
		SHADER_MODULE_CREATE_INFO,
		PIPELINE_CACHE_CREATE_INFO,
		PIPELINE_SHADER_STAGE_CREATE_INFO,
		PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
		PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
		PIPELINE_TESSELLATION_STATE_CREATE_INFO,
		PIPELINE_VIEWPORT_STATE_CREATE_INFO,
		PIPELINE_RASTERIZATION_STATE_CREATE_INFO,
		PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,
		PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO,
		PIPELINE_COLOR_BLEND_STATE_CREATE_INFO,
		PIPELINE_DYNAMIC_STATE_CREATE_INFO,
		GRAPHICS_PIPELINE_CREATE_INFO,
		COMPUTE_PIPELINE_CREATE_INFO,
		PIPELINE_LAYOUT_CREATE_INFO,
		SAMPLER_CREATE_INFO,
		DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
		DESCRIPTOR_POOL_CREATE_INFO,
		DESCRIPTOR_SET_ALLOCATE_INFO,
		WRITE_DESCRIPTOR_SET,
		COPY_DESCRIPTOR_SET,
		FRAMEBUFFER_CREATE_INFO,
		RENDER_PASS_CREATE_INFO,
		COMMAND_POOL_CREATE_INFO,
		COMMAND_BUFFER_ALLOCATE_INFO,
		COMMAND_BUFFER_INHERITANCE_INFO,
		COMMAND_BUFFER_BEGIN_INFO,
		RENDER_PASS_BEGIN_INFO,
		BUFFER_MEMORY_BARRIER,
		IMAGE_MEMORY_BARRIER,
		MEMORY_BARRIER,
		LOADER_INSTANCE_CREATE_INFO,
		LOADER_DEVICE_CREATE_INFO,
		SWAPCHAIN_CREATE_INFO_KHR,
		PRESENT_INFO_KHR,
		DISPLAY_MODE_CREATE_INFO_KHR,
		DISPLAY_SURFACE_CREATE_INFO_KHR,
		DISPLAY_PRESENT_INFO_KHR,
		XLIB_SURFACE_CREATE_INFO_KHR,
		XCB_SURFACE_CREATE_INFO_KHR,
		WAYLAND_SURFACE_CREATE_INFO_KHR,
		MIR_SURFACE_CREATE_INFO_KHR,
		ANDROID_SURFACE_CREATE_INFO_KHR,
		WIN32_SURFACE_CREATE_INFO_KHR,
		DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT,
		PIPELINE_RASTERIZATION_STATE_RASTERIZATION_ORDER_AMD,
		DEBUG_MARKER_OBJECT_NAME_INFO_EXT,
		DEBUG_MARKER_OBJECT_TAG_INFO_EXT,
		DEBUG_MARKER_MARKER_INFO_EXT,
		DEDICATED_ALLOCATION_IMAGE_CREATE_INFO_NV,
		DEDICATED_ALLOCATION_BUFFER_CREATE_INFO_NV,
		DEDICATED_ALLOCATION_MEMORY_ALLOCATE_INFO_NV
	}

	public enum SystemAllocationScope {
		COMMAND,
		OBJECT,
		CACHE,
		DEVICE,
		INSTANCE,
	}

	public enum InternalAllocationType {
		EXECUTABLE,
	}

	public enum Format
	{
		UNDEFINED,
		R4G4_UNORM_PACK8,
		R4G4B4A4_UNORM_PACK16,
		B4G4R4A4_UNORM_PACK16,
		R5G6B5_UNORM_PACK16,
		B5G6R5_UNORM_PACK16,
		R5G5B5A1_UNORM_PACK16,
		B5G5R5A1_UNORM_PACK16,
		A1R5G5B5_UNORM_PACK16,
		R8_UNORM,
		R8_SNORM,
		R8_USCALED,
		R8_SSCALED,
		R8_UINT,
		R8_SINT,
		R8_SRGB,
		R8G8_UNORM,
		R8G8_SNORM,
		R8G8_USCALED,
		R8G8_SSCALED,
		R8G8_UINT,
		R8G8_SINT,
		R8G8_SRGB,
		R8G8B8_UNORM,
		R8G8B8_SNORM,
		R8G8B8_USCALED,
		R8G8B8_SSCALED,
		R8G8B8_UINT,
		R8G8B8_SINT,
		R8G8B8_SRGB,
		B8G8R8_UNORM,
		B8G8R8_SNORM,
		B8G8R8_USCALED,
		B8G8R8_SSCALED,
		B8G8R8_UINT,
		B8G8R8_SINT,
		B8G8R8_SRGB,
		R8G8B8A8_UNORM,
		R8G8B8A8_SNORM,
		R8G8B8A8_USCALED,
		R8G8B8A8_SSCALED,
		R8G8B8A8_UINT,
		R8G8B8A8_SINT,
		R8G8B8A8_SRGB,
		B8G8R8A8_UNORM,
		B8G8R8A8_SNORM,
		B8G8R8A8_USCALED,
		B8G8R8A8_SSCALED,
		B8G8R8A8_UINT,
		B8G8R8A8_SINT,
		B8G8R8A8_SRGB,
		A8B8G8R8_UNORM_PACK32,
		A8B8G8R8_SNORM_PACK32,
		A8B8G8R8_USCALED_PACK32,
		A8B8G8R8_SSCALED_PACK32,
		A8B8G8R8_UINT_PACK32,
		A8B8G8R8_SINT_PACK32,
		A8B8G8R8_SRGB_PACK32,
		A2R10G10B10_UNORM_PACK32,
		A2R10G10B10_SNORM_PACK32,
		A2R10G10B10_USCALED_PACK32,
		A2R10G10B10_SSCALED_PACK32,
		A2R10G10B10_UINT_PACK32,
		A2R10G10B10_SINT_PACK32,
		A2B10G10R10_UNORM_PACK32,
		A2B10G10R10_SNORM_PACK32,
		A2B10G10R10_USCALED_PACK32,
		A2B10G10R10_SSCALED_PACK32,
		A2B10G10R10_UINT_PACK32,
		A2B10G10R10_SINT_PACK32,
		R16_UNORM,
		R16_SNORM,
		R16_USCALED,
		R16_SSCALED,
		R16_UINT,
		R16_SINT,
		R16_SFLOAT,
		R16G16_UNORM,
		R16G16_SNORM,
		R16G16_USCALED,
		R16G16_SSCALED,
		R16G16_UINT,
		R16G16_SINT,
		R16G16_SFLOAT,
		R16G16B16_UNORM,
		R16G16B16_SNORM,
		R16G16B16_USCALED,
		R16G16B16_SSCALED,
		R16G16B16_UINT,
		R16G16B16_SINT,
		R16G16B16_SFLOAT,
		R16G16B16A16_UNORM,
		R16G16B16A16_SNORM,
		R16G16B16A16_USCALED,
		R16G16B16A16_SSCALED,
		R16G16B16A16_UINT,
		R16G16B16A16_SINT,
		R16G16B16A16_SFLOAT,
		R32_UINT,
		R32_SINT,
		R32_SFLOAT,
		R32G32_UINT,
		R32G32_SINT,
		R32G32_SFLOAT,
		R32G32B32_UINT,
		R32G32B32_SINT,
		R32G32B32_SFLOAT,
		R32G32B32A32_UINT,
		R32G32B32A32_SINT,
		R32G32B32A32_SFLOAT,
		R64_UINT,
		R64_SINT,
		R64_SFLOAT,
		R64G64_UINT,
		R64G64_SINT,
		R64G64_SFLOAT,
		R64G64B64_UINT,
		R64G64B64_SINT,
		R64G64B64_SFLOAT,
		R64G64B64A64_UINT,
		R64G64B64A64_SINT,
		R64G64B64A64_SFLOAT,
		B10G11R11_UFLOAT_PACK32,
		E5B9G9R9_UFLOAT_PACK32,
		D16_UNORM,
		X8_D24_UNORM_PACK32,
		D32_SFLOAT,
		S8_UINT,
		D16_UNORM_S8_UINT,
		D24_UNORM_S8_UINT,
		D32_SFLOAT_S8_UINT,
		BC1_RGB_UNORM_BLOCK,
		BC1_RGB_SRGB_BLOCK,
		BC1_RGBA_UNORM_BLOCK,
		BC1_RGBA_SRGB_BLOCK,
		BC2_UNORM_BLOCK,
		BC2_SRGB_BLOCK,
		BC3_UNORM_BLOCK,
		BC3_SRGB_BLOCK,
		BC4_UNORM_BLOCK,
		BC4_SNORM_BLOCK,
		BC5_UNORM_BLOCK,
		BC5_SNORM_BLOCK,
		BC6H_UFLOAT_BLOCK,
		BC6H_SFLOAT_BLOCK,
		BC7_UNORM_BLOCK,
		BC7_SRGB_BLOCK,
		ETC2_R8G8B8_UNORM_BLOCK,
		ETC2_R8G8B8_SRGB_BLOCK,
		ETC2_R8G8B8A1_UNORM_BLOCK,
		ETC2_R8G8B8A1_SRGB_BLOCK,
		ETC2_R8G8B8A8_UNORM_BLOCK,
		ETC2_R8G8B8A8_SRGB_BLOCK,
		EAC_R11_UNORM_BLOCK,
		EAC_R11_SNORM_BLOCK,
		EAC_R11G11_UNORM_BLOCK,
		EAC_R11G11_SNORM_BLOCK,
		ASTC_4x4_UNORM_BLOCK = 157,
		ASTC_4x4_SRGB_BLOCK = 158,
		ASTC_5x4_UNORM_BLOCK = 159,
		ASTC_5x4_SRGB_BLOCK = 160,
		ASTC_5x5_UNORM_BLOCK = 161,
		ASTC_5x5_SRGB_BLOCK = 162,
		ASTC_6x5_UNORM_BLOCK = 163,
		ASTC_6x5_SRGB_BLOCK = 164,
		ASTC_6x6_UNORM_BLOCK = 165,
		ASTC_6x6_SRGB_BLOCK = 166,
		ASTC_8x5_UNORM_BLOCK = 167,
		ASTC_8x5_SRGB_BLOCK = 168,
		ASTC_8x6_UNORM_BLOCK = 169,
		ASTC_8x6_SRGB_BLOCK = 170,
		ASTC_8x8_UNORM_BLOCK = 171,
		ASTC_8x8_SRGB_BLOCK = 172,
		ASTC_10x5_UNORM_BLOCK = 173,
		ASTC_10x5_SRGB_BLOCK = 174,
		ASTC_10x6_UNORM_BLOCK = 175,
		ASTC_10x6_SRGB_BLOCK = 176,
		ASTC_10x8_UNORM_BLOCK = 177,
		ASTC_10x8_SRGB_BLOCK = 178,
		ASTC_10x10_UNORM_BLOCK = 179,
		ASTC_10x10_SRGB_BLOCK = 180,
		ASTC_12x10_UNORM_BLOCK = 181,
		ASTC_12x10_SRGB_BLOCK = 182,
		ASTC_12x12_UNORM_BLOCK = 183,
		ASTC_12x12_SRGB_BLOCK = 184,
	}

	public enum ImageType
	{
		1D,
		2D,
		3D,
	}

	public enum ImageTiling
	{
		OPTIMAL,
		LINEAR,
	}

	public enum PhysicalDeviceType
	{
		OTHER,
		INTEGRATED_GPU,
		DISCRETE_GPU,
		VIRTUAL_GPU,
		CPU,
	}

	public enum QueryType
	{
		OCCLUSION,
		PIPELINE_STATISTICS,
		TIMESTAMP,
	}

	public enum SharingMode
	{
		EXCLUSIVE,
		CONCURRENT,
	}

	public enum ImageLayout {
		UNDEFINED,
		GENERAL,
		COLOR_ATTACHMENT_OPTIMAL,
		DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
		DEPTH_STENCIL_READ_ONLY_OPTIMAL,
		SHADER_READ_ONLY_OPTIMAL,
		TRANSFER_SRC_OPTIMAL,
		TRANSFER_DST_OPTIMAL,
		PREINITIALIZED,
		PRESENT_SRC_KHR,
	}

	public enum ImageViewType {
		1D,
		2D,
		3D,
		CUBE,
		1D_ARRAY,
		2D_ARRAY,
		CUBE_ARRAY,
	}

	public enum ComponentSwizzle
	{
		IDENTITY,
		ZERO,
		ONE,
		R,
		G,
		B,
		A,
	}

	public enum VerteInputRate
	{
		VERTEX,
		INSTANCE,
	}

	public enum PrimitiveTopology
	{
		POINT_LIST,
		LINE_LIST,
		LINE_STRIP,
		TRIANGLE_LIST,
		TRIANGLE_STRIP,
		TRIANGLE_FAN,
		LINE_LIST_WITH_ADJACENCY,
		LINE_STRIP_WITH_ADJACENCY,
		TRIANGLE_LIST_WITH_ADJACENCY,
		TRIANGLE_STRIP_WITH_ADJACENCY,
		PATCH_LIST,
	}

	public enum PolygonMode
	{
		FILL,
		LINE,
		POINT,
	}

	public enum FrontFace {
		COUNTER_CLOCKWISE,
		CLOCKWISE,
	}

	public enum CompareOp {
		NEVER,
		LESS,
		EQUAL,
		LESS_OR_EQUAL,
		GREATER,
		NOT_EQUAL,
		GREATER_OR_EQUAL,
		ALWAYS,
	}

	public enum StencilOp {
		KEEP,
		ZERO,
		REPLACE,
		INCREMENT_AND_CLAMP,
		DECREMENT_AND_CLAMP,
		INVERT,
		INCREMENT_AND_WRAP,
		DECREMENT_AND_WRAP,
	}

	public enum LogicOp {
		CLEAR,
		AND,
		AND_REVERSE,
		COPY,
		AND_INVERTED,
		NO_OP,
		XOR,
		OR,
		NOR,
		EQUIVALENT,
		INVERT,
		OR_REVERSE,
		COPY_INVERTED,
		OR_INVERTED,
		NAND,
		SET,
	}

	public enum BlendFactor {
		ZERO,
		ONE,
		SRC_COLOR,
		ONE_MINUS_SRC_COLOR,
		DST_COLOR,
		ONE_MINUS_DST_COLOR,
		SRC_ALPHA,
		ONE_MINUS_SRC_ALPHA,
		DST_ALPHA,
		ONE_MINUS_DST_ALPHA,
		CONSTANT_COLOR,
		ONE_MINUS_CONSTANT_COLOR,
		CONSTANT_ALPHA,
		ONE_MINUS_CONSTANT_ALPHA,
		SRC_ALPHA_SATURATE,
		SRC1_COLOR,
		ONE_MINUS_SRC1_COLOR,
		SRC1_ALPHA,
		ONE_MINUS_SRC1_ALPHA,
	}

	public enum BlendOp
	{
		ADD,
		SUBTRACT,
		REVERSE_SUBTRACT,
		MIN,
		MAX,
	}

	public enum DynamicState
	{
		VIEWPORT,
		SCISSOR,
		LINE_WIDTH,
		DEPTH_BIAS,
		BLEND_CONSTANTS,
		DEPTH_BOUNDS,
		STENCIL_COMPARE_MASK,
		STENCIL_WRITE_MASK,
		STENCIL_REFERENCE,
	}

	public enum Filter
	{
		NEAREST,
		LINEAR,
		CUBIC_IMG,
	}

	public enum SamplerMipmapMode
	{
		NEAREST,
		LINEAR,
	}

	public enum SamplerAddressMode {
		REPEAT,
		MIRRORED_REPEAT,
		CLAMP_TO_EDGE,
		CLAMP_TO_BORDER,
		MIRROR_CLAMP_TO_EDGE,
	}

	public enum BorderColor {
		FLOAT_TRANSPARENT_BLACK,
		INT_TRANSPARENT_BLACK,
		FLOAT_OPAQUE_BLACK,
		INT_OPAQUE_BLACK,
		FLOAT_OPAQUE_WHITE,
		INT_OPAQUE_WHITE,
	}

	public enum DescriptorType {
		SAMPLER,
		COMBINED_IMAGE_SAMPLER,
		SAMPLED_IMAGE,
		STORAGE_IMAGE,
		UNIFORM_TEXEL_BUFFER,
		STORAGE_TEXEL_BUFFER,
		UNIFORM_BUFFER,
		STORAGE_BUFFER,
		UNIFORM_BUFFER_DYNAMIC,
		STORAGE_BUFFER_DYNAMIC,
		INPUT_ATTACHMENT,
	}

	public enum AttachmentLoadOp {
		LOAD_OP_LOAD,
		LOAD_OP_CLEAR,
		LOAD_OP_DONT_CARE,
	}

	public enum AttachmentStoreOp {
		STORE_OP_STORE,
		STORE_OP_DONT_CARE,
	}

	public enum PipelineBindPoint {
		PIPELINE_BIND_POINT_GRAPHICS,
		PIPELINE_BIND_POINT_COMPUTE,
	}

	public enum CommandBufferLevel {
		COMMAND_BUFFER_LEVEL_PRIMARY,
		COMMAND_BUFFER_LEVEL_SECONDARY
	}

	public enum IndeType
	{
		UINT16,
		UINT32
	}

	public enum SubpassContents {
		INLINE,
		SECONDARY_COMMAND_BUFFERS
	}

	[Flags]
	public enum InstanceCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum FormatFeatureFlags
	{
		SAMPLED_IMAGE_BIT,
		STORAGE_IMAGE_BIT,
		STORAGE_IMAGE_ATOMIC_BIT,
		UNIFORM_TEXEL_BUFFER_BIT,
		STORAGE_TEXEL_BUFFER_BIT,
		STORAGE_TEXEL_BUFFER_ATOMIC_BIT,
		VERTEX_BUFFER_BIT,
		COLOR_ATTACHMENT_BIT,
		COLOR_ATTACHMENT_BLEND_BIT,
		DEPTH_STENCIL_ATTACHMENT_BIT,
		BLIT_SRC_BIT,
		BLIT_DST_BIT,
		SAMPLED_IMAGE_FILTER_LINEAR_BIT,
		SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG,
	}

	[Flags]
	public enum ImageUsageFlags
	{
		TRANSFER_SRC_BIT,
		TRANSFER_DST_BIT,
		SAMPLED_BIT,
		STORAGE_BIT,
		COLOR_ATTACHMENT_BIT,
		DEPTH_STENCIL_ATTACHMENT_BIT,
		TRANSIENT_ATTACHMENT_BIT,
		INPUT_ATTACHMENT_BIT,
	}

	[Flags]
	public enum ImageCreateFlags
	{
		SPARSE_BINDING_BIT,
		SPARSE_RESIDENCY_BIT,
		SPARSE_ALIASED_BIT,
		MUTABLE_FORMAT_BIT,
		CUBE_COMPATIBLE_BIT,
	}

	[Flags]
	public enum SampleCountFlags {
		1_BIT,
		2_BIT,
		4_BIT,
		8_BIT,
		16_BIT,
		32_BIT,
		64_BIT
	}

	[Flags]
	public enum QueueFlags {
		GRAPHICS_BIT,
		COMPUTE_BIT,
		TRANSFER_BIT,
		SPARSE_BINDING_BIT,
	}

	[Flags]
	public enum MemoryPropertyFlags {
		DEVICE_LOCAL_BIT,
		HOST_VISIBLE_BIT,
		HOST_COHERENT_BIT,
		HOST_CACHED_BIT,
		LAZILY_ALLOCATED_BIT,
	}

	[Flags]
	public enum MemoryHeapFlags
	{
		DEVICE_LOCAL_BIT,
	}

	[Flags]
	public enum DeviceCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum DeviceQueueCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineStageFlags
	{
		TOP_OF_PIPE_BIT,
		DRAW_INDIRECT_BIT,
		VERTEX_INPUT_BIT,
		VERTEX_SHADER_BIT,
		TESSELLATION_CONTROL_SHADER_BIT,
		TESSELLATION_EVALUATION_SHADER_BIT,
		GEOMETRY_SHADER_BIT,
		FRAGMENT_SHADER_BIT,
		EARLY_FRAGMENT_TESTS_BIT,
		LATE_FRAGMENT_TESTS_BIT,
		COLOR_ATTACHMENT_OUTPUT_BIT,
		COMPUTE_SHADER_BIT,
		TRANSFER_BIT,
		BOTTOM_OF_PIPE_BIT,
		HOST_BIT,
		ALL_GRAPHICS_BIT,
		ALL_COMMANDS_BIT,
	}

	[Flags]
	public enum MemoryMapFlags{
		NONE // FIXME
	}

	[Flags]
	public enum ImageAspectFlags {
		COLOR_BIT,
		DEPTH_BIT,
		STENCIL_BIT,
		METADATA_BIT,
	}

	[Flags]
	public enum SparseImageFormatFlags {
		SINGLE_MIPTAIL_BIT,
		ALIGNED_MIP_SIZE_BIT,
		NONSTANDARD_BLOCK_SIZE_BIT,
	}

	[Flags]
	public enum SparseMemoryBindFlags {
		SPARSE_MEMORY_BIND_METADATA_BIT,
	}

	[Flags]
	public enum FenceCreateFlags {
		FENCE_CREATE_SIGNALED_BIT,
	}

	[Flags]
	public enum SemaphoreCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum EventCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum QueryPoolCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum QueryPipelineStatisticFlags {
		INPUT_ASSEMBLY_VERTICES_BIT,
		INPUT_ASSEMBLY_PRIMITIVES_BIT,
		VERTEX_SHADER_INVOCATIONS_BIT,
		GEOMETRY_SHADER_INVOCATIONS_BIT,
		GEOMETRY_SHADER_PRIMITIVES_BIT,
		CLIPPING_INVOCATIONS_BIT,
		CLIPPING_PRIMITIVES_BIT,
		FRAGMENT_SHADER_INVOCATIONS_BIT,
		TESSELLATION_CONTROL_SHADER_PATCHES_BIT,
		TESSELLATION_EVALUATION_SHADER_INVOCATIONS_BIT,
		COMPUTE_SHADER_INVOCATIONS_BIT,
	}

	[Flags]
	public enum QueryResultFlags {
		64_BIT,
		WAIT_BIT,
		WITH_AVAILABILITY_BIT,
		PARTIAL_BIT,
	}

	[Flags]
	public enum BufferCreateFlags {
		BINDING_BIT,
		RESIDENCY_BIT,
		ALIASED_BIT,
	}

	[Flags]
	public enum BufferUsageFlags {
		TRANSFER_SRC_BIT,
		TRANSFER_DST_BIT,
		UNIFORM_TEXEL_BUFFER_BIT,
		STORAGE_TEXEL_BUFFER_BIT,
		UNIFORM_BUFFER_BIT,
		STORAGE_BUFFER_BIT,
		INDEX_BUFFER_BIT,
		VERTEX_BUFFER_BIT,
		INDIRECT_BUFFER_BIT,
	}

	[Flags]
	public enum BufferViewCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum ImageViewCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum ShaderModuleCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineCacheCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineCreateFlags {
		DISABLE_OPTIMIZATION_BIT,
		ALLOW_DERIVATIVES_BIT,
		DERIVATIVE_BIT,
	}

	[Flags]
	public enum PipelineShaderStageCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum ShaderStageFlags {
		VERTEX_BIT,
		TESSELLATION_CONTROL_BIT,
		TESSELLATION_EVALUATION_BIT,
		GEOMETRY_BIT,
		FRAGMENT_BIT,
		COMPUTE_BIT,
		ALL_GRAPHICSF,
		ALLFFFFFFF,
	}

	[Flags]
	public enum PipelineVerteInputStateCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineInputAssemblyStateCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineTessellationStateCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineViewportStateCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineRasterizationStateCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum CullModeFlags {
		NONE,
		FRONT_BIT,
		BACK_BIT,
		FRONT_AND_BACK,
	}

	[Flags]
	public enum PipelineMultisampleStateCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineDepthStencilStateCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineColorBlendStateCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum ColorComponentFlags {
		R_BIT,
		G_BIT,
		B_BIT,
		A_BIT,
	}

	[Flags]
	public enum PipelineDynamicStateCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum PipelineLayoutCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum SamplerCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum DescriptorSetLayoutCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum DescriptorPoolCreateFlags {
		DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT,
	}

	[Flags]
	public enum DescriptorPoolResetFlags {
		NONE // FIXME
	}

	[Flags]
	public enum FramebufferCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum RenderPassCreateFlags {
		NONE // FIXME
	}

	[Flags]
	public enum AttachmentDescriptionFlags {
		ATTACHMENT_DESCRIPTION_MAY_ALIAS_BIT,
	}

	[Flags]
	public enum SubpassDescriptionFlags {
		NONE // FIXME
	}

	[Flags]
	public enum AccessFlags {
		INDIRECT_COMMAND_READ_BIT,
		INDEX_READ_BIT,
		VERTEX_ATTRIBUTE_READ_BIT,
		UNIFORM_READ_BIT,
		INPUT_ATTACHMENT_READ_BIT,
		SHADER_READ_BIT,
		SHADER_WRITE_BIT,
		COLOR_ATTACHMENT_READ_BIT,
		COLOR_ATTACHMENT_WRITE_BIT,
		DEPTH_STENCIL_ATTACHMENT_READ_BIT,
		DEPTH_STENCIL_ATTACHMENT_WRITE_BIT,
		TRANSFER_READ_BIT,
		TRANSFER_WRITE_BIT,
		HOST_READ_BIT,
		HOST_WRITE_BIT,
		MEMORY_READ_BIT,
		MEMORY_WRITE_BIT,
	}

	[Flags]
	public enum DependencyFlags {
		DEPENDENCY_BY_REGION_BIT,
	}

	[Flags]
	public enum CommandPoolCreateFlags {
		TRANSIENT_BIT,
		RESET_COMMAND_BUFFER_BIT,
	}

	[Flags]
	public enum CommandPoolResetFlags {
		COMMAND_POOL_RESET_RELEASE_RESOURCES_BIT,
	}

	[Flags]
	public enum CommandBufferUsageFlags {
		ONE_TIME_SUBMIT_BIT,
		RENDER_PASS_CONTINUE_BIT,
		SIMULTANEOUS_USE_BIT,
	}

	[Flags]
	public enum QueryControlFlags {
		QUERY_CONTROL_PRECISE_BIT,
	}

	[Flags]
	public enum CommandBufferResetFlags {
		COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT,
	}

	[Flags]
	public enum StencilFaceFlags {
		STENCIL_FACE_FRONT_BIT,
		STENCIL_FACE_BACK_BIT,
		STENCIL_FRONT_AND_BACK,
	}

	public delegate void* PFN_vkAllocationFunction( void*                                       pUserData, size_t                                      size, size_t                                      alignment, SystemAllocationScope                     allocationScope);
	public delegate void* PFN_vkReallocationFunction ( void*                                       pUserData, void*                                       pOriginal, size_t                                      size, size_t                                      alignment, SystemAllocationScope                     allocationScope);
	public delegate void* PFN_vkFreeFunction( void*                                       pUserData, void*                                       pMemory);
	public delegate void* PFN_vkInternalAllocationNotification( void*                                       pUserData, size_t                                      size, InternalAllocationType                    allocationType, SystemAllocationScope                     allocationScope);
	public delegate void* PFN_vkInternalFreeNotification ( void*                                       pUserData, size_t                                      size, InternalAllocationType                    allocationType, SystemAllocationScope                     allocationScope);

	[CCode (has_type_id = false)]
	public struct ApplicationInfo {
		StructureType sType;
		void*         pNet;
		string        pApplicationName;
		uint32        applicationVersion;
		string        pEngineName;
		uint32        engineVersion;
		uint32        apiVersion;
	}

	[CCode (has_type_id = false)]
	public struct InstanceCreateInfo {
		StructureType       sType;
		void*               pNet;
		InstanceCreateFlags flags;
		ApplicationInfo     pApplicationInfo;
		[CCode (array_length_cname = "enabledLayerCount")]
		string[]            ppEnabledLayerNames;
		[CCode (array_length_cname = "enabledEtensionCount")]
		string[]            ppEnabledEtensionNames;
	}

	[CCode (has_type_id = false)]
	public struct AllocationCallbacks
	{
		void*                                   pUserData;
		PFN_vkAllocationFunction                pfnAllocation;
		PFN_vkReallocationFunction              pfnReallocation;
		PFN_vkFreeFunction                      pfnFree;
		PFN_vkInternalAllocationNotification    pfnInternalAllocation;
		PFN_vkInternalFreeNotification          pfnInternalFree;
	}

	[CCode (has_type_id = false)]
	public struct PhysicalDeviceFeatures
	{
		bool robustBufferAccess;
		bool fullDrawIndeUint32;
		bool imageCubeArray;
		bool independentBlend;
		bool geometryShader;
		bool tessellationShader;
		bool sampleRateShading;
		bool dualSrcBlend;
		bool logicOp;
		bool multiDrawIndirect;
		bool drawIndirectFirstInstance;
		bool depthClamp;
		bool depthBiasClamp;
		bool fillModeNonSolid;
		bool depthBounds;
		bool wideLines;
		bool largePoints;
		bool alphaToOne;
		bool multiViewport;
		bool samplerAnisotropy;
		bool tetureCompressionETC2;
		bool tetureCompressionASTC_LDR;
		bool tetureCompressionBC;
		bool occlusionQueryPrecise;
		bool pipelineStatisticsQuery;
		bool vertePipelineStoresAndAtomics;
		bool fragmentStoresAndAtomics;
		bool shaderTessellationAndGeometryPointSize;
		bool shaderImageGatherEtended;
		bool shaderStorageImageEtendedFormats;
		bool shaderStorageImageMultisample;
		bool shaderStorageImageReadWithoutFormat;
		bool shaderStorageImageWriteWithoutFormat;
		bool shaderUniformBufferArrayDynamicIndeing;
		bool shaderSampledImageArrayDynamicIndeing;
		bool shaderStorageBufferArrayDynamicIndeing;
		bool shaderStorageImageArrayDynamicIndeing;
		bool shaderClipDistance;
		bool shaderCullDistance;
		bool shaderFloat64;
		bool shaderInt64;
		bool shaderInt16;
		bool shaderResourceResidency;
		bool shaderResourceMinLod;
		bool sparseBinding;
		bool sparseResidencyBuffer;
		bool sparseResidencyImage2D;
		bool sparseResidencyImage3D;
		bool sparseResidency2Samples;
		bool sparseResidency4Samples;
		bool sparseResidency8Samples;
		bool sparseResidency16Samples;
		bool sparseResidencyAliased;
		bool variableMultisampleRate;
		bool inheritedQueries;
	}

	[CCode (has_type_id = false)]
	public struct FormatProperties {
		FormatFeatureFlags    linearTilingFeatures;
		FormatFeatureFlags    optimalTilingFeatures;
		FormatFeatureFlags    bufferFeatures;
	}

	[CCode (has_type_id = false)]
	public struct Etent3D {
		uint32    width;
		uint32    height;
		uint32    depth;
	}

	[CCode (has_type_id = false)]
	public struct ImageFormatProperties {
		Etent3D            maEtent;
		uint32              maMipLevels;
		uint32              maArrayLayers;
		SampleCountFlags    sampleCounts;
		DeviceSize          maResourceSize;
	}

	[CCode (has_type_id = false)]
	public struct PhysicalDeviceLimits
	{
		uint32           maImageDimension1D;
		uint32           maImageDimension2D;
		uint32           maImageDimension3D;
		uint32           maImageDimensionCube;
		uint32           maImageArrayLayers;
		uint32           maTeelBufferElements;
		uint32           maUniformBufferRange;
		uint32           maStorageBufferRange;
		uint32           maPushConstantsSize;
		uint32           maMemoryAllocationCount;
		uint32           maSamplerAllocationCount;
		DeviceSize       bufferImageGranularity;
		DeviceSize       sparseAddressSpaceSize;
		uint32           maBoundDescriptorSets;
		uint32           maPerStageDescriptorSamplers;
		uint32           maPerStageDescriptorUniformBuffers;
		uint32           maPerStageDescriptorStorageBuffers;
		uint32           maPerStageDescriptorSampledImages;
		uint32           maPerStageDescriptorStorageImages;
		uint32           maPerStageDescriptorInputAttachments;
		uint32           maPerStageResources;
		uint32           maDescriptorSetSamplers;
		uint32           maDescriptorSetUniformBuffers;
		uint32           maDescriptorSetUniformBuffersDynamic;
		uint32           maDescriptorSetStorageBuffers;
		uint32           maDescriptorSetStorageBuffersDynamic;
		uint32           maDescriptorSetSampledImages;
		uint32           maDescriptorSetStorageImages;
		uint32           maDescriptorSetInputAttachments;
		uint32           maVerteInputAttributes;
		uint32           maVerteInputBindings;
		uint32           maVerteInputAttributeOffset;
		uint32           maVerteInputBindingStride;
		uint32           maVerteOutputComponents;
		uint32           maTessellationGenerationLevel;
		uint32           maTessellationPatchSize;
		uint32           maTessellationControlPerVerteInputComponents;
		uint32           maTessellationControlPerVerteOutputComponents;
		uint32           maTessellationControlPerPatchOutputComponents;
		uint32           maTessellationControlTotalOutputComponents;
		uint32           maTessellationEvaluationInputComponents;
		uint32           maTessellationEvaluationOutputComponents;
		uint32           maGeometryShaderInvocations;
		uint32           maGeometryInputComponents;
		uint32           maGeometryOutputComponents;
		uint32           maGeometryOutputVertices;
		uint32           maGeometryTotalOutputComponents;
		uint32           maFragmentInputComponents;
		uint32           maFragmentOutputAttachments;
		uint32           maFragmentDualSrcAttachments;
		uint32           maFragmentCombinedOutputResources;
		uint32           maComputeSharedMemorySize;
		uint32           maComputeWorkGroupCount[3];
		uint32           maComputeWorkGroupInvocations;
		uint32           maComputeWorkGroupSize[3];
		uint32           subPielPrecisionBits;
		uint32           subTeelPrecisionBits;
		uint32           mipmapPrecisionBits;
		uint32           maDrawIndeedIndeValue;
		uint32           maDrawIndirectCount;
		float            maSamplerLodBias;
		float            maSamplerAnisotropy;
		uint32           maViewports;
		uint32           maViewportDimensions[2];
		float            viewportBoundsRange[2];
		uint32           viewportSubPielBits;
		size_t           minMemoryMapAlignment;
		DeviceSize       minTeelBufferOffsetAlignment;
		DeviceSize       minUniformBufferOffsetAlignment;
		DeviceSize       minStorageBufferOffsetAlignment;
		int32            minTeelOffset;
		uint32           maTeelOffset;
		int32            minTeelGatherOffset;
		uint32           maTeelGatherOffset;
		float            minInterpolationOffset;
		float            maInterpolationOffset;
		uint32           subPielInterpolationOffsetBits;
		uint32           maFramebufferWidth;
		uint32           maFramebufferHeight;
		uint32           maFramebufferLayers;
		SampleCountFlags framebufferColorSampleCounts;
		SampleCountFlags framebufferDepthSampleCounts;
		SampleCountFlags framebufferStencilSampleCounts;
		SampleCountFlags framebufferNoAttachmentsSampleCounts;
		uint32           maColorAttachments;
		SampleCountFlags sampledImageColorSampleCounts;
		SampleCountFlags sampledImageIntegerSampleCounts;
		SampleCountFlags sampledImageDepthSampleCounts;
		SampleCountFlags sampledImageStencilSampleCounts;
		SampleCountFlags storageImageSampleCounts;
		uint32           maSampleMaskWords;
		bool             timestampComputeAndGraphics;
		float            timestampPeriod;
		uint32           maClipDistances;
		uint32           maCullDistances;
		uint32           maCombinedClipAndCullDistances;
		uint32           discreteQueuePriorities;
		float            pointSizeRange[2];
		float            lineWidthRange[2];
		float            pointSizeGranularity;
		float            lineWidthGranularity;
		bool             strictLines;
		bool             standardSampleLocations;
		DeviceSize       optimalBufferCopyOffsetAlignment;
		DeviceSize       optimalBufferCopyRowPitchAlignment;
		DeviceSize       nonCoherentAtomSize;
	}

	[CCode (has_type_id = false)]
	public struct PhysicalDeviceSparseProperties
	{
		bool residencyStandard2DBlockShape;
		bool residencyStandard2DMultisampleBlockShape;
		bool residencyStandard3DBlockShape;
		bool residencyAlignedMipSize;
		bool residencyNonResidentStrict;
	}

	[CCode (has_type_id = false)]
	public struct PhysicalDeviceProperties
	{
		uint32                         apiVersion;
		uint32                         driverVersion;
		uint32                         vendorID;
		uint32                         deviceID;
		PhysicalDeviceType             deviceType;
		char                           deviceName[MAX_PHYSICAL_DEVICE_NAME_SIZE];
		uint8                          pipelineCacheUUID[UUID_SIZE];
		PhysicalDeviceLimits           limits;
		PhysicalDeviceSparseProperties sparseProperties;
	}

	[CCode (has_type_id = false)]
	public struct QueueFamilyProperties {
		QueueFlags    queueFlags;
		uint32        queueCount;
		uint32        timestampValidBits;
		Etent3D      minImageTransferGranularity;
	}

	[CCode (has_type_id = false)]
	public struct MemoryType {
		MemoryPropertyFlags    propertyFlags;
		uint32                 heapInde;
	}

	[CCode (has_type_id = false)]
	public struct MemoryHeap {
		DeviceSize         size;
		MemoryHeapFlags    flags;
	}

	[CCode (has_type_id = false)]
	public struct PhysicalDeviceMemoryProperties {
		uint32        memoryTypeCount;
		MemoryType    memoryTypes[MAX_MEMORY_TYPES];
		uint32        memoryHeapCount;
		MemoryHeap    memoryHeaps[MAX_MEMORY_HEAPS];
	}

	[CCode (has_type_id = false)]
	public struct DeviceQueueCreateInfo {
		StructureType          sType;
		void*                  pNet;
		DeviceQueueCreateFlags flags;
		uint32                 queueFamilyInde;
		uint32                 queueCount;
		float*                 pQueuePriorities;
	}

	[CCode (has_type_id = false)]
	public struct DeviceCreateInfo {
		StructureType          sType;
		void*                  pNet;
		DeviceCreateFlags      flags;
		uint32                 queueCreateInfoCount;
		DeviceQueueCreateInfo  pQueueCreateInfos;
		uint32                 enabledLayerCount;
		string[]               ppEnabledLayerNames;
		uint32                 enabledEtensionCount;
		string[]               ppEnabledEtensionNames;
		PhysicalDeviceFeatures pEnabledFeatures;
	}

	[CCode (has_type_id = false)]
	public struct EtensionProperties {
		char        etensionName[MAX_EXTENSION_NAME_SIZE];
		uint32    specVersion;
	}

	[CCode (has_type_id = false)]
	public struct LayerProperties {
		char        layerName[MAX_EXTENSION_NAME_SIZE];
		uint32    specVersion;
		uint32    implementationVersion;
		char        description[MAX_DESCRIPTION_SIZE];
	}

	[CCode (has_type_id = false)]
	public struct SubmitInfo {
		StructureType       sType;
		void*               pNet;
		[CCode (array_length_cname = "waitSemaphoreCount")]
		Semaphore[]         pWaitSemaphores;
		PipelineStageFlags* pWaitDstStageMask;
		[CCode (array_length_cname = "commandBufferCount")]
		CommandBuffer[]     pCommandBuffers;
		[CCode (array_length_cname = "signalSemaphoreCount")]
		Semaphore[]         pSignalSemaphores;
	}

	[CCode (has_type_id = false)]
	public struct MemoryAllocateInfo {
		StructureType sType;
		void*         pNet;
		DeviceSize    allocationSize;
		uint32        memoryTypeInde;
	}

	[CCode (has_type_id = false)]
	public struct MappedMemoryRange {
		StructureType sType;
		void*         pNet;
		DeviceMemory  memory;
		DeviceSize    offset;
		DeviceSize    size;
	}

	[CCode (has_type_id = false)]
	public struct MemoryRequirements {
		DeviceSize    size;
		DeviceSize    alignment;
		uint32        memoryTypeBits;
	}

	[CCode (has_type_id = false)]
	public struct SparseImageFormatProperties {
		ImageAspectFlags          aspectMask;
		Etent3D                  imageGranularity;
		SparseImageFormatFlags    flags;
	}

	[CCode (has_type_id = false)]
	public struct SparseImageMemoryRequirements {
		SparseImageFormatProperties    formatProperties;
		uint32                         imageMipTailFirstLod;
		DeviceSize                     imageMipTailSize;
		DeviceSize                     imageMipTailOffset;
		DeviceSize                     imageMipTailStride;
	}

	[CCode (has_type_id = false)]
	public struct SparseMemoryBind {
		DeviceSize               resourceOffset;
		DeviceSize               size;
		DeviceMemory             memory;
		DeviceSize               memoryOffset;
		SparseMemoryBindFlags    flags;
	}

	[CCode (has_type_id = false)]
	public struct SparseBufferMemoryBindInfo {
		Buffer            buffer;
		[CCode (array_length_cname = "bindCount")]
		SparseMemoryBind[] pBinds;
	}

	[CCode (has_type_id = false)]
	public struct SparseImageOpaqueMemoryBindInfo {
		Image             image;
		[CCode (array_length_cname = "bindCount")]
		SparseMemoryBind[] pBinds;
	}

	[CCode (has_type_id = false)]
	public struct ImageSubresource {
		ImageAspectFlags    aspectMask;
		uint32              mipLevel;
		uint32              arrayLayer;
	}

	[CCode (has_type_id = false)]
	public struct Offset3D {
		int32    x;
		int32    y;
		int32    z;
	}

	[CCode (has_type_id = false)]
	public struct SparseImageMemoryBind {
		ImageSubresource         subresource;
		Offset3D                 offset;
		Etent3D                 etent;
		DeviceMemory             memory;
		DeviceSize               memoryOffset;
		SparseMemoryBindFlags    flags;
	}

	[CCode (has_type_id = false)]
	public struct SparseImageMemoryBindInfo {
		Image                  image;
		[CCode (array_length_cname = "bindCount")]
		SparseImageMemoryBind[] pBinds;
	}

	[CCode (has_type_id = false)]
	public struct BindSparseInfo {
		StructureType                     sType;
		void*                             pNet;
		uint32                            waitSemaphoreCount;
		Semaphore[]                       pWaitSemaphores;
		uint32                            bufferBindCount;
		SparseBufferMemoryBindInfo[]      pBufferBinds;
		uint32                            imageOpaqueBindCount;
		SparseImageOpaqueMemoryBindInfo[] pImageOpaqueBinds;
		uint32                            imageBindCount;
		SparseImageMemoryBindInfo[]       pImageBinds;
		uint32                            signalSemaphoreCount;
		Semaphore[]                       pSignalSemaphores;
	}

	[CCode (has_type_id = false)]
	public struct FenceCreateInfo {
		StructureType    sType;
		void*            pNet;
		FenceCreateFlags flags;
	}

	[CCode (has_type_id = false)]
	public struct SemaphoreCreateInfo {
		StructureType        sType;
		void*                pNet;
		SemaphoreCreateFlags flags;
	}

	[CCode (has_type_id = false)]
	public struct EventCreateInfo {
		StructureType    sType;
		void*            pNet;
		EventCreateFlags flags;
	}

	[CCode (has_type_id = false)]
	public struct QueryPoolCreateInfo {
		StructureType               sType;
		void*                       pNet;
		QueryPoolCreateFlags        flags;
		QueryType                   queryType;
		uint32                      queryCount;
		QueryPipelineStatisticFlags pipelineStatistics;
	}

	[CCode (has_type_id = false)]
	public struct BufferCreateInfo {
		StructureType     sType;
		void*             pNet;
		BufferCreateFlags flags;
		DeviceSize        size;
		BufferUsageFlags  usage;
		SharingMode       sharingMode;
		uint32            queueFamilyIndeCount;
		uint32*           pQueueFamilyIndices;
	}

	[CCode (has_type_id = false)]
	public struct BufferViewCreateInfo {
		StructureType         sType;
		void*                 pNet;
		BufferViewCreateFlags flags;
		Buffer                buffer;
		Format                format;
		DeviceSize            offset;
		DeviceSize            range;
	}

	[CCode (has_type_id = false)]
	public struct ImageCreateInfo {
		StructureType    sType;
		void*            pNet;
		ImageCreateFlags flags;
		ImageType        imageType;
		Format           format;
		Etent3D         etent;
		uint32           mipLevels;
		uint32           arrayLayers;
		SampleCountFlags samples;
		ImageTiling      tiling;
		ImageUsageFlags  usage;
		SharingMode      sharingMode;
		uint32           queueFamilyIndeCount;
		uint32*          pQueueFamilyIndices;
		ImageLayout      initialLayout;
	}

	[CCode (has_type_id = false)]
	public struct SubresourceLayout {
		DeviceSize    offset;
		DeviceSize    size;
		DeviceSize    rowPitch;
		DeviceSize    arrayPitch;
		DeviceSize    depthPitch;
	}

	[CCode (has_type_id = false)]
	public struct ComponentMapping {
		ComponentSwizzle    r;
		ComponentSwizzle    g;
		ComponentSwizzle    b;
		ComponentSwizzle    a;
	}

	[CCode (has_type_id = false)]
	public struct ImageSubresourceRange {
		ImageAspectFlags    aspectMask;
		uint32              baseMipLevel;
		uint32              levelCount;
		uint32              baseArrayLayer;
		uint32              layerCount;
	}

	[CCode (has_type_id = false)]
	public struct ImageViewCreateInfo {
		StructureType         sType;
		void*                 pNet;
		ImageViewCreateFlags  flags;
		Image                 image;
		ImageViewType         viewType;
		Format                format;
		ComponentMapping      components;
		ImageSubresourceRange subresourceRange;
	}

	[CCode (has_type_id = false)]
	public struct ShaderModuleCreateInfo {
		StructureType           sType;
		void*                   pNet;
		ShaderModuleCreateFlags flags;
		size_t                  codeSize;
		uint32*                 pCode;
	}

	[CCode (has_type_id = false)]
	public struct PipelineCacheCreateInfo {
		StructureType            sType;
		void*                    pNet;
		PipelineCacheCreateFlags flags;
		size_t                   initialDataSize;
		void*                    pInitialData;
	}

	[CCode (has_type_id = false)]
	public struct SpecializationMapEntry {
		uint32    constantID;
		uint32    offset;
		size_t      size;
	}

	[CCode (has_type_id = false)]
	public struct SpecializationInfo {
		uint32                  mapEntryCount;
		SpecializationMapEntry* pMapEntries;
		size_t                  dataSize;
		void*                   pData;
	}

	[CCode (has_type_id = false)]
	public struct PipelineShaderStageCreateInfo {
		StructureType                  sType;
		void*                          pNet;
		PipelineShaderStageCreateFlags flags;
		ShaderStageFlags               stage;
		ShaderModule                   module;
		string                         pName;
		SpecializationInfo             pSpecializationInfo;
	}

	[CCode (has_type_id = false)]
	public struct VerteInputBindingDescription {
		uint32             binding;
		uint32             stride;
		VerteInputRate    inputRate;
	}

	[CCode (has_type_id = false)]
	public struct VerteInputAttributeDescription {
		uint32    location;
		uint32    binding;
		Format    format;
		uint32    offset;
	}

	[CCode (has_type_id = false)]
	public struct PipelineVerteInputStateCreateInfo {
		StructureType                       sType;
		void*                               pNet;
		PipelineVerteInputStateCreateFlags flags;
		uint32                              verteBindingDescriptionCount;
		VerteInputBindingDescription       pVerteBindingDescriptions;
		uint32                              verteAttributeDescriptionCount;
		VerteInputAttributeDescription     pVerteAttributeDescriptions;
	}

	[CCode (has_type_id = false)]
	public struct PipelineInputAssemblyStateCreateInfo {
		StructureType                         sType;
		void*                                 pNet;
		PipelineInputAssemblyStateCreateFlags flags;
		PrimitiveTopology                     topology;
		bool                                  primitiveRestartEnable;
	}

	[CCode (has_type_id = false)]
	public struct PipelineTessellationStateCreateInfo {
		StructureType                        sType;
		void*                                pNet;
		PipelineTessellationStateCreateFlags flags;
		uint32                               patchControlPoints;
	}

	[CCode (has_type_id = false)]
	public struct Viewport {
		float    x;
		float    y;
		float    width;
		float    height;
		float    minDepth;
		float    maDepth;
	}

	[CCode (has_type_id = false)]
	public struct Offset2D {
		int32    x;
		int32    y;
	}

	[CCode (has_type_id = false)]
	public struct Etent2D {
		uint32    width;
		uint32    height;
	}

	[CCode (has_type_id = false)]
	public struct Rect2D {
		Offset2D    offset;
		Etent2D    etent;
	}

	[CCode (has_type_id = false)]
	public struct PipelineViewportStateCreateInfo {
		StructureType                    sType;
		void*                            pNet;
		PipelineViewportStateCreateFlags flags;
		[CCode (array_length_cname = "viewportCount")]
		Viewport[]                        pViewports;
		[CCode (array_length_cname = "scissorCount")]
		Rect2D[]                          pScissors;
	}

	[CCode (has_type_id = false)]
	public struct PipelineRasterizationStateCreateInfo {
		StructureType                         sType;
		void*                                 pNet;
		PipelineRasterizationStateCreateFlags flags;
		bool                                  depthClampEnable;
		bool                                  rasterizerDiscardEnable;
		PolygonMode                           polygonMode;
		CullModeFlags                         cullMode;
		FrontFace                             frontFace;
		bool                                  depthBiasEnable;
		float                                 depthBiasConstantFactor;
		float                                 depthBiasClamp;
		float                                 depthBiasSlopeFactor;
		float                                 lineWidth;
	}

	[CCode (has_type_id = false)]
	public struct PipelineMultisampleStateCreateInfo {
		StructureType                       sType;
		void*                               pNet;
		PipelineMultisampleStateCreateFlags flags;
		SampleCountFlags                    rasterizationSamples;
		bool                                sampleShadingEnable;
		float                               minSampleShading;
		SampleMask                          pSampleMask;
		bool                                alphaToCoverageEnable;
		bool                                alphaToOneEnable;
	}

	[CCode (has_type_id = false)]
	public struct StencilOpState {
		StencilOp    failOp;
		StencilOp    passOp;
		StencilOp    depthFailOp;
		CompareOp    compareOp;
		uint32       compareMask;
		uint32       writeMask;
		uint32       reference;
	}

	[CCode (has_type_id = false)]
	public struct PipelineDepthStencilStateCreateInfo {
		StructureType                        sType;
		void*                                pNet;
		PipelineDepthStencilStateCreateFlags flags;
		bool                                 depthTestEnable;
		bool                                 depthWriteEnable;
		CompareOp                            depthCompareOp;
		bool                                 depthBoundsTestEnable;
		bool                                 stencilTestEnable;
		StencilOpState                       front;
		StencilOpState                       back;
		float                                minDepthBounds;
		float                                maDepthBounds;
	}

	[CCode (has_type_id = false)]
	public struct PipelineColorBlendAttachmentState {
		bool                blendEnable;
		BlendFactor         srcColorBlendFactor;
		BlendFactor         dstColorBlendFactor;
		BlendOp             colorBlendOp;
		BlendFactor         srcAlphaBlendFactor;
		BlendFactor         dstAlphaBlendFactor;
		BlendOp             alphaBlendOp;
		ColorComponentFlags colorWriteMask;
	}

	[CCode (has_type_id = false)]
	public struct PipelineColorBlendStateCreateInfo {
		StructureType                       sType;
		void*                               pNet;
		PipelineColorBlendStateCreateFlags  flags;
		bool                                logicOpEnable;
		LogicOp                             logicOp;
		[CCode (array_length_cname = "attachmentCount")]
		PipelineColorBlendAttachmentState[] pAttachments;
		float                               blendConstants[4];
	}

	[CCode (has_type_id = false)]
	public struct PipelineDynamicStateCreateInfo {
		StructureType                   sType;
		void*                           pNet;
		PipelineDynamicStateCreateFlags flags;
		[CCode (array_length_cname = "dynamicStateCount")]
		DynamicState[]                  pDynamicStates;
	}

	[CCode (has_type_id = false)]
	public struct GraphicsPipelineCreateInfo {
		StructureType                        sType;
		void*                                pNet;
		PipelineCreateFlags                  flags;
		[CCode (array_length_cname = "stageCount")]
		PipelineShaderStageCreateInfo[]      pStages;
		PipelineVerteInputStateCreateInfo   pVerteInputState;
		PipelineInputAssemblyStateCreateInfo pInputAssemblyState;
		PipelineTessellationStateCreateInfo  pTessellationState;
		PipelineViewportStateCreateInfo      pViewportState;
		PipelineRasterizationStateCreateInfo pRasterizationState;
		PipelineMultisampleStateCreateInfo   pMultisampleState;
		PipelineDepthStencilStateCreateInfo  pDepthStencilState;
		PipelineColorBlendStateCreateInfo    pColorBlendState;
		PipelineDynamicStateCreateInfo       pDynamicState;
		PipelineLayout                       layout;
		RenderPass                           renderPass;
		uint32                               subpass;
		Pipeline                             basePipelineHandle;
		int32                                basePipelineInde;
	}

	[CCode (has_type_id = false)]
	public struct ComputePipelineCreateInfo {
		StructureType                 sType;
		void*                         pNet;
		PipelineCreateFlags           flags;
		PipelineShaderStageCreateInfo stage;
		PipelineLayout                layout;
		Pipeline                      basePipelineHandle;
		int32                         basePipelineInde;
	}

	[CCode (has_type_id = false)]
	public struct PushConstantRange {
		ShaderStageFlags    stageFlags;
		uint32              offset;
		uint32              size;
	}

	[CCode (has_type_id = false)]
	public struct PipelineLayoutCreateInfo {
		StructureType             sType;
		void*                     pNet;
		PipelineLayoutCreateFlags flags;
		[CCode (array_length_cname = "setLayoutCount")]
		DescriptorSetLayout[]      pSetLayouts;
		[CCode (array_length_cname = "pushConstantRangeCount")]
		PushConstantRange[]        pPushConstantRanges;
	}

	[CCode (has_type_id = false)]
	public struct SamplerCreateInfo {
		StructureType      sType;
		void*              pNet;
		SamplerCreateFlags flags;
		Filter             magFilter;
		Filter             minFilter;
		SamplerMipmapMode  mipmapMode;
		SamplerAddressMode addressModeU;
		SamplerAddressMode addressModeV;
		SamplerAddressMode addressModeW;
		float              mipLodBias;
		bool               anisotropyEnable;
		float              maAnisotropy;
		bool               compareEnable;
		CompareOp          compareOp;
		float              minLod;
		float              maLod;
		BorderColor        borderColor;
		bool               unnormalizedCoordinates;
	}

	[CCode (has_type_id = false)]
	public struct DescriptorSetLayoutBinding {
		uint32           binding;
		DescriptorType   descriptorType;
		uint32           descriptorCount;
		ShaderStageFlags stageFlags;
		Sampler*         pImmutableSamplers;
	}

	[CCode (has_type_id = false)]
	public struct DescriptorSetLayoutCreateInfo {
		StructureType                        sType;
		void*                            pNet;
		DescriptorSetLayoutCreateFlags       flags;
		uint32                               bindingCount;
		DescriptorSetLayoutBinding*    pBindings;
	}

	[CCode (has_type_id = false)]
	public struct DescriptorPoolSize {
		DescriptorType    type;
		uint32            descriptorCount;
	}

	[CCode (has_type_id = false)]
	public struct DescriptorPoolCreateInfo {
		StructureType                sType;
		void*                    pNet;
		DescriptorPoolCreateFlags    flags;
		uint32                       maSets;
		uint32                       poolSizeCount;
		DescriptorPoolSize*    pPoolSizes;
	}

	[CCode (has_type_id = false)]
	public struct DescriptorSetAllocateInfo {
		StructureType                 sType;
		void*                     pNet;
		DescriptorPool                descriptorPool;
		uint32                        descriptorSetCount;
		DescriptorSetLayout*    pSetLayouts;
	}

	[CCode (has_type_id = false)]
	public struct DescriptorImageInfo {
		Sampler        sampler;
		ImageView      imageView;
		ImageLayout    imageLayout;
	}

	[CCode (has_type_id = false)]
	public struct DescriptorBufferInfo {
		Buffer        buffer;
		DeviceSize    offset;
		DeviceSize    range;
	}

	[CCode (has_type_id = false)]
	public struct WriteDescriptorSet {
		StructureType                  sType;
		void*                      pNet;
		DescriptorSet                  dstSet;
		uint32                         dstBinding;
		uint32                         dstArrayElement;
		uint32                         descriptorCount;
		DescriptorType                 descriptorType;
		DescriptorImageInfo*     pImageInfo;
		DescriptorBufferInfo*    pBufferInfo;
		BufferView*              pTeelBufferView;
	}

	[CCode (has_type_id = false)]
	public struct CopyDescriptorSet {
		StructureType    sType;
		void*        pNet;
		DescriptorSet    srcSet;
		uint32           srcBinding;
		uint32           srcArrayElement;
		DescriptorSet    dstSet;
		uint32           dstBinding;
		uint32           dstArrayElement;
		uint32           descriptorCount;
	}

	[CCode (has_type_id = false)]
	public struct FramebufferCreateInfo {
		StructureType             sType;
		void*                 pNet;
		FramebufferCreateFlags    flags;
		RenderPass                renderPass;
		uint32                    attachmentCount;
		ImageView*          pAttachments;
		uint32                    width;
		uint32                    height;
		uint32                    layers;
	}

	[CCode (has_type_id = false)]
	public struct AttachmentDescription {
		AttachmentDescriptionFlags    flags;
		Format                        format;
		SampleCountFlags           samples;
		AttachmentLoadOp              loadOp;
		AttachmentStoreOp             storeOp;
		AttachmentLoadOp              stencilLoadOp;
		AttachmentStoreOp             stencilStoreOp;
		ImageLayout                   initialLayout;
		ImageLayout                   finalLayout;
	}

	[CCode (has_type_id = false)]
	public struct AttachmentReference {
		uint32         attachment;
		ImageLayout    layout;
	}

	[CCode (has_type_id = false)]
	public struct SubpassDescription {
		SubpassDescriptionFlags       flags;
		PipelineBindPoint             pipelineBindPoint;
		uint32                        inputAttachmentCount;
		AttachmentReference*    pInputAttachments;
		uint32                        colorAttachmentCount;
		AttachmentReference*    pColorAttachments;
		AttachmentReference*    pResolveAttachments;
		AttachmentReference*    pDepthStencilAttachment;
		uint32                        preserveAttachmentCount;
		uint32*                 pPreserveAttachments;
	}

	[CCode (has_type_id = false)]
	public struct SubpassDependency {
		uint32                srcSubpass;
		uint32                dstSubpass;
		PipelineStageFlags    srcStageMask;
		PipelineStageFlags    dstStageMask;
		AccessFlags           srcAccessMask;
		AccessFlags           dstAccessMask;
		DependencyFlags       dependencyFlags;
	}

	[CCode (has_type_id = false)]
	public struct RenderPassCreateInfo {
		StructureType                   sType;
		void*                       pNet;
		RenderPassCreateFlags           flags;
		uint32                          attachmentCount;
		AttachmentDescription*    pAttachments;
		uint32                          subpassCount;
		SubpassDescription*       pSubpasses;
		uint32                          dependencyCount;
		SubpassDependency*        pDependencies;
	}

	[CCode (has_type_id = false)]
	public struct CommandPoolCreateInfo {
		StructureType             sType;
		void*                 pNet;
		CommandPoolCreateFlags    flags;
		uint32                    queueFamilyInde;
	}

	[CCode (has_type_id = false)]
	public struct CommandBufferAllocateInfo {
		StructureType         sType;
		void*             pNet;
		CommandPool           commandPool;
		CommandBufferLevel    level;
		uint32                commandBufferCount;
	}

	[CCode (has_type_id = false)]
	public struct CommandBufferInheritanceInfo {
		StructureType                  sType;
		void*                      pNet;
		RenderPass                     renderPass;
		uint32                         subpass;
		Framebuffer                    framebuffer;
		bool                         occlusionQueryEnable;
		QueryControlFlags              queryFlags;
		QueryPipelineStatisticFlags    pipelineStatistics;
	}

	[CCode (has_type_id = false)]
	public struct CommandBufferBeginInfo {
		StructureType                          sType;
		void*                              pNet;
		CommandBufferUsageFlags                flags;
		CommandBufferInheritanceInfo*    pInheritanceInfo;
	}

	[CCode (has_type_id = false)]
	public struct BufferCopy {
		DeviceSize    srcOffset;
		DeviceSize    dstOffset;
		DeviceSize    size;
	}

	[CCode (has_type_id = false)]
	public struct ImageSubresourceLayers {
		ImageAspectFlags    aspectMask;
		uint32              mipLevel;
		uint32              baseArrayLayer;
		uint32              layerCount;
	}

	[CCode (has_type_id = false)]
	public struct ImageCopy {
		ImageSubresourceLayers    srcSubresource;
		Offset3D                  srcOffset;
		ImageSubresourceLayers    dstSubresource;
		Offset3D                  dstOffset;
		Etent3D                  etent;
	}

	[CCode (has_type_id = false)]
	public struct ImageBlit {
		ImageSubresourceLayers    srcSubresource;
		Offset3D                  srcOffsets[2];
		ImageSubresourceLayers    dstSubresource;
		Offset3D                  dstOffsets[2];
	}

	[CCode (has_type_id = false)]
	public struct BufferImageCopy {
		DeviceSize                bufferOffset;
		uint32                    bufferRowLength;
		uint32                    bufferImageHeight;
		ImageSubresourceLayers    imageSubresource;
		Offset3D                  imageOffset;
		Etent3D                  imageEtent;
	}

	[CCode (has_type_id = false)]
	public struct ClearColorValue {
		float       float32[4];
		int32     int32[4];
		uint32    uint32[4];
	}

	[CCode (has_type_id = false)]
	public struct ClearDepthStencilValue {
		float       depth;
		uint32    stencil;
	}

	[CCode (has_type_id = false)]
	public struct ClearValue {
		ClearColorValue           color;
		ClearDepthStencilValue    depthStencil;
	}

	[CCode (has_type_id = false)]
	public struct ClearAttachment {
		ImageAspectFlags    aspectMask;
		uint32              colorAttachment;
		ClearValue          clearValue;
	}

	[CCode (has_type_id = false)]
	public struct ClearRect {
		Rect2D    rect;
		uint32    baseArrayLayer;
		uint32    layerCount;
	}

	[CCode (has_type_id = false)]
	public struct ImageResolve {
		ImageSubresourceLayers    srcSubresource;
		Offset3D                  srcOffset;
		ImageSubresourceLayers    dstSubresource;
		Offset3D                  dstOffset;
		Etent3D                  etent;
	}

	[CCode (has_type_id = false)]
	public struct MemoryBarrier {
		StructureType    sType;
		void*        pNet;
		AccessFlags      srcAccessMask;
		AccessFlags      dstAccessMask;
	}

	[CCode (has_type_id = false)]
	public struct BufferMemoryBarrier {
		StructureType    sType;
		void*        pNet;
		AccessFlags      srcAccessMask;
		AccessFlags      dstAccessMask;
		uint32           srcQueueFamilyInde;
		uint32           dstQueueFamilyInde;
		Buffer           buffer;
		DeviceSize       offset;
		DeviceSize       size;
	}

	[CCode (has_type_id = false)]
	public struct ImageMemoryBarrier {
		StructureType            sType;
		void*                pNet;
		AccessFlags              srcAccessMask;
		AccessFlags              dstAccessMask;
		ImageLayout              oldLayout;
		ImageLayout              newLayout;
		uint32                   srcQueueFamilyInde;
		uint32                   dstQueueFamilyInde;
		Image                    image;
		ImageSubresourceRange    subresourceRange;
	}

	[CCode (has_type_id = false)]
	public struct RenderPassBeginInfo {
		StructureType        sType;
		void*            pNet;
		RenderPass           renderPass;
		Framebuffer          framebuffer;
		Rect2D               renderArea;
		uint32               clearValueCount;
		ClearValue*    pClearValues;
	}

	[CCode (has_type_id = false)]
	public struct DispatchIndirectCommand {
		uint32    x;
		uint32    y;
		uint32    z;
	}

	[CCode (has_type_id = false)]
	public struct DrawIndeedIndirectCommand {
		uint32    indeCount;
		uint32    instanceCount;
		uint32    firstInde;
		int32     verteOffset;
		uint32    firstInstance;
	}

	[CCode (has_type_id = false)]
	public struct DrawIndirectCommand {
		uint32    verteCount;
		uint32    instanceCount;
		uint32    firstVerte;
		uint32    firstInstance;
	}

	public const int KHR_surface;
	[CCode (has_type_id = false)]
	public struct SurfaceKHR {}

	public const int KHR_SURFACE_SPEC_VERSION;
	public const string KHR_SURFACE_EXTENSION_NAME;
	/*
	public const COLORSPACE_SRGB_NONLINEAR_KHR  COLOR_SPACE_SRGB_NONLINEAR_KHR
	*/


	public enum ColorSpaceKHR {
		COLOR_SPACE_SRGB_NONLINEAR_KHR
	}

	public enum PresentModeKHR {
		IMMEDIATE_KHR,
		MAILBOX_KHR,
		FIFO_KHR,
		FIFO_RELAXED_KHR,
	}


	[Flags]
	public enum SurfaceTransformFlagsKHR {
		IDENTITY_BIT_KHR,
		ROTATE_90_BIT_KHR,
		ROTATE_180_BIT_KHR,
		ROTATE_270_BIT_KHR,
		HORIZONTAL_MIRROR_BIT_KHR,
		HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR,
		HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR,
		HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR,
		INHERIT_BIT_KHR,
	}

	[Flags]
	public enum CompositeAlphaFlagsKHR {
		OPAQUE_BIT_KHR,
		PRE_MULTIPLIED_BIT_KHR,
		POST_MULTIPLIED_BIT_KHR,
		INHERIT_BIT_KHR,
	}

	[CCode (has_type_id = false)]
	public struct SurfaceCapabilitiesKHR {
		uint32                         minImageCount;
		uint32                         maImageCount;
		Etent2D                       currentEtent;
		Etent2D                       minImageEtent;
		Etent2D                       maImageEtent;
		uint32                         maImageArrayLayers;
		SurfaceTransformFlagsKHR       supportedTransforms;
		SurfaceTransformFlagsKHR    currentTransform;
		CompositeAlphaFlagsKHR         supportedCompositeAlpha;
		ImageUsageFlags                supportedUsageFlags;
	}

	[CCode (has_type_id = false)]
	public struct SurfaceFormatKHR {
		Format           format;
		ColorSpaceKHR    colorSpace;
	}

	public void DestroySurfaceKHR(
		Instance                                  instance,
		SurfaceKHR                                surface,
		AllocationCallbacks                pAllocator);

	public const int KHR_swapchain;
	[CCode (has_type_id = false)]
	public struct SwapchainKHR {}

	public const int KHR_SWAPCHAIN_SPEC_VERSION;
	public const string KHR_SWAPCHAIN_EXTENSION_NAME;

	[Flags]
	public enum SwapchainCreateFlagsKHR {
		NONE // FIXME
	}

	[CCode (has_type_id = false)]
	public struct SwapchainCreateInfoKHR {
		StructureType            sType;
		void*                    pNet;
		SwapchainCreateFlagsKHR  flags;
		SurfaceKHR               surface;
		uint32                   minImageCount;
		Format                   imageFormat;
		ColorSpaceKHR            imageColorSpace;
		Etent2D                 imageEtent;
		uint32                   imageArrayLayers;
		ImageUsageFlags          imageUsage;
		SharingMode              imageSharingMode;
		[CCode (array_length_cname = "queueFamilyIndeCount")]
		uint32[]                 pQueueFamilyIndices;
		SurfaceTransformFlagsKHR preTransform;
		CompositeAlphaFlagsKHR   compositeAlpha;
		PresentModeKHR           presentMode;
		bool                     clipped;
		SwapchainKHR             oldSwapchain;
	}

	[CCode (has_type_id = false)]
	public struct PresentInfoKHR {
		StructureType  sType;
		void*          pNet;
		[CCode (array_length_cname = "waitSemaphoreCount")]
		Semaphore[]    pWaitSemaphores;
		[CCode (array_length_cname = "swapchainCount")]
		SwapchainKHR[] pSwapchains;
		uint32*        pImageIndices;
		Result*        pResults;
	}

	public Result CreateSwapchainKHR(
		Device                                    device,
		SwapchainCreateInfoKHR*             pCreateInfo,
		AllocationCallbacks                pAllocator,
		SwapchainKHR*                             pSwapchain);

	public void DestroySwapchainKHR(
		Device                                    device,
		SwapchainKHR                              swapchain,
		AllocationCallbacks                      pAllocator);

	public Result GetSwapchainImagesKHR(
		Device                                    device,
		SwapchainKHR                              swapchain,
		[CCode (array_length_cname = "pSwapchainImageCount")]
		Image[]                                    pSwapchainImages);

	public Result AcquireNetImageKHR(
		Device                                    device,
		SwapchainKHR                              swapchain,
		uint64                                    timeout,
		Semaphore                                 semaphore,
		Fence                                     fence,
		uint32*                                   pImageInde);

	public Result QueuePresentKHR(
		Queue                                     queue,
		PresentInfoKHR*                     pPresentInfo);

	public const int KHR_display;
	[CCode (has_type_id = false)]
	public struct DisplayKHR {}
	[CCode (has_type_id = false)]
	public struct DisplayModeKHR {}

	public const int KHR_DISPLAY_SPEC_VERSION;
	public const string KHR_DISPLAY_EXTENSION_NAME;

	[Flags]
	public enum DisplayPlaneAlphaFlagsKHR
	{
		OPAQUE_BIT_KHR,
		GLOBAL_BIT_KHR,
		PER_PIXEL_BIT_KHR,
		PER_PIXEL_PREMULTIPLIED_BIT_KHR
	}

	[Flags]
	public enum DisplayModeCreateFlagsKHR {
		NONE // FIXME
	}

	[Flags]
	public enum DisplaySurfaceCreateFlagsKHR {
		NONE // FIXME
	}

	[CCode (has_type_id = false)]
	public struct DisplayPropertiesKHR {
		DisplayKHR               display;
		string                   displayName;
		Etent2D                 physicalDimensions;
		Etent2D                 physicalResolution;
		SurfaceTransformFlagsKHR supportedTransforms;
		bool                     planeReorderPossible;
		bool                     persistentContent;
	}

	[CCode (has_type_id = false)]
	public struct DisplayModeParametersKHR {
		Etent2D    visibleRegion;
		uint32      refreshRate;
	}

	[CCode (has_type_id = false)]
	public struct DisplayModePropertiesKHR {
		DisplayModeKHR              displayMode;
		DisplayModeParametersKHR    parameters;
	}

	[CCode (has_type_id = false)]
	public struct DisplayModeCreateInfoKHR {
		StructureType                sType;
		void*                    pNet;
		DisplayModeCreateFlagsKHR    flags;
		DisplayModeParametersKHR     parameters;
	}

	[CCode (has_type_id = false)]
	public struct DisplayPlaneCapabilitiesKHR {
		DisplayPlaneAlphaFlagsKHR supportedAlpha;
		Offset2D                  minSrcPosition;
		Offset2D                  maSrcPosition;
		Etent2D                  minSrcEtent;
		Etent2D                  maSrcEtent;
		Offset2D                  minDstPosition;
		Offset2D                  maDstPosition;
		Etent2D                  minDstEtent;
		Etent2D                  maDstEtent;
	}

	[CCode (has_type_id = false)]
	public struct DisplayPlanePropertiesKHR {
		DisplayKHR currentDisplay;
		uint32     currentStackInde;
	}

	[CCode (has_type_id = false)]
	public struct DisplaySurfaceCreateInfoKHR {
		StructureType                sType;
		void*                        pNet;
		DisplaySurfaceCreateFlagsKHR flags;
		DisplayModeKHR               displayMode;
		uint32                       planeInde;
		uint32                       planeStackInde;
		SurfaceTransformFlagsKHR     transform;
		float                        globalAlpha;
		DisplayPlaneAlphaFlagsKHR    alphaMode;
		Etent2D                     imageEtent;
	}

	public const int KHR_display_swapchain;
	public const int KHR_DISPLAY_SWAPCHAIN_SPEC_VERSION;
	public const string KHR_DISPLAY_SWAPCHAIN_EXTENSION_NAME;

	[CCode (has_type_id = false)]
	public struct DisplayPresentInfoKHR {
		StructureType sType;
		void*         pNet;
		Rect2D        srcRect;
		Rect2D        dstRect;
		bool          persistent;
	}

	public Result CreateSharedSwapchainsKHR(
		Device                                    device,
		uint32                                    swapchainCount,
		SwapchainCreateInfoKHR*             pCreateInfos,
		AllocationCallbacks                pAllocator,
		SwapchainKHR*                             pSwapchains);

	namespace Xlib
	{
		public const int KHR_lib_surface;

		public const int KHR_XLIB_SURFACE_SPEC_VERSION;
		public const string KHR_XLIB_SURFACE_EXTENSION_NAME;

		[Flags]
		public enum XlibSurfaceCreateFlagsKHR {
			NONE // FIXME
		}

		[CCode (has_type_id = false)]
		public struct XlibSurfaceCreateInfoKHR {
			StructureType             sType;
			void*                     pNet;
			XlibSurfaceCreateFlagsKHR flags;
			X.Display                 dpy;
			X.Window                  window;
		}

		public Result CreateXlibSurfaceKHR(
			Instance                                  instance,
			XlibSurfaceCreateInfoKHR*           pCreateInfo,
			AllocationCallbacks                pAllocator,
			SurfaceKHR*                               pSurface);

		public bool GetPhysicalDeviceXlibPresentationSupportKHR(
			PhysicalDevice                            physicalDevice,
			uint32                                    queueFamilyInde,
			X.Display                                    dpy,
			X.VisualID                                    visualID);
	}

	namespace Xcb
	{
		public const int KHR_cb_surface;

		public const int KHR_XCB_SURFACE_SPEC_VERSION;
		public const string KHR_XCB_SURFACE_EXTENSION_NAME;

		[Flags]
		public enum XcbSurfaceCreateFlagsKHR {
			NONE // FIXME
		}

		[CCode (has_type_id = false)]
		public struct XcbSurfaceCreateInfoKHR {
			StructureType            sType;
			void*                    pNet;
			XcbSurfaceCreateFlagsKHR flags;
			global::Xcb.Connection   connection;
			global::Xcb.Window       window;
		}

		public Result CreateXcbSurfaceKHR( Instance                instance, XcbSurfaceCreateInfoKHR pCreateInfo, AllocationCallbacks     pAllocator, out SurfaceKHR          pSurface);
		public bool GetPhysicalDeviceXcbPresentationSupportKHR( PhysicalDevice physicalDevice, uint32         queueFamilyInde, global::Xcb.Connection connection, global::Xcb.VisualID   visual_id);
	}

	namespace Wayland
	{
		public const int KHR_wayland_surface;

		public const int KHR_WAYLAND_SURFACE_SPEC_VERSION;
		public const string KHR_WAYLAND_SURFACE_EXTENSION_NAME;

		[Flags]
		public enum WaylandSurfaceCreateFlagsKHR {
			NONE // FIXME
		}

		[CCode (has_type_id = false)]
		public struct WaylandSurfaceCreateInfoKHR {
			StructureType                sType;
			void*                        pNet;
			WaylandSurfaceCreateFlagsKHR flags;
			global::Wayland.Display      display;
			global::Wayland.Surface      surface;
		}

		public Result CreateWaylandSurfaceKHR( Instance instance, WaylandSurfaceCreateInfoKHR pCreateInfo, AllocationCallbacks pAllocator, out SurfaceKHR pSurface);
		public bool GetPhysicalDeviceWaylandPresentationSupportKHR( PhysicalDevice physicalDevice, uint32 queueFamilyInde, global::Wayland.Display display);
	}

	namespace Mir
	{
		public const int KHR_mir_surface;

		public const int KHR_MIR_SURFACE_SPEC_VERSION;
		public const string KHR_MIR_SURFACE_EXTENSION_NAME;

		[Flags]
		public enum MirSurfaceCreateFlagsKHR {
			NONE // FIXME
		}

		[CCode (has_type_id = false)]
		public struct MirSurfaceCreateInfoKHR {
			StructureType            sType;
			void*                    pNet;
			MirSurfaceCreateFlagsKHR flags;
			global::Mir.Connection   connection;
			global::Mir.Surface      mirSurface;
		}

		public Result CreateMirSurfaceKHR (Instance instance, MirSurfaceCreateInfoKHR pCreateInfo, AllocationCallbacks pAllocator, out SurfaceKHR pSurface);
		public bool GetPhysicalDeviceMirPresentationSupportKHR( PhysicalDevice physicalDevice, uint32 queueFamilyInde, global::Mir.Connection connection);
	}

	namespace Android
	{
	public const int KHR_android_surface;

	public const int KHR_ANDROID_SURFACE_SPEC_VERSION;
	public const string KHR_ANDROID_SURFACE_EXTENSION_NAME;

	[Flags]
	public enum AndroidSurfaceCreateFlagsKHR {
		NONE // FIXME
	}

	[CCode (has_type_id = false)]
	public struct AndroidSurfaceCreateInfoKHR
	{
		StructureType                sType;
		void*                        pNet;
		AndroidSurfaceCreateFlagsKHR flags;
		global::Android.NativeWindow window;
	}

	public Result CreateAndroidSurfaceKHR(
		Instance                     instance,
		AndroidSurfaceCreateInfoKHR* pCreateInfo,
		AllocationCallbacks         pAllocator,
		SurfaceKHR*                  pSurface);
	}

	namespace Win32
	{
		public const int KHR_win32_surface;

		public const int KHR_WIN32_SURFACE_SPEC_VERSION;
		public const string KHR_WIN32_SURFACE_EXTENSION_NAME;

		[Flags]
		public enum Win32SurfaceCreateFlagsKHR {
			NONE // FIXME
		}

		[CCode (has_type_id = false)]
		public struct Win32SurfaceCreateInfoKHR
		{
			StructureType              sType;
			void*                      pNet;
			Win32SurfaceCreateFlagsKHR flags;
			global::Win32.HINSTANCE    hinstance;
			global::Win32.HWND         hwnd;
		}

		public Result CreateWin32SurfaceKHR( Instance instance, Win32SurfaceCreateInfoKHR* pCreateInfo, AllocationCallbacks pAllocator, out SurfaceKHR pSurface);
		public bool GetPhysicalDeviceWin32PresentationSupportKHR( PhysicalDevice physicalDevice, uint32 queueFamilyInde);
	}

	public const int KHR_sampler_mirror_clamp_to_edge;
	public const int KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_SPEC_VERSION;
	public const string KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_EXTENSION_NAME;

	public const int EXT_debug_report;
	[CCode (has_type_id = false)]
	public struct DebugReportCallbackEXT {}

	public const int EXT_DEBUG_REPORT_SPEC_VERSION;
	public const string EXT_DEBUG_REPORT_EXTENSION_NAME;
	// public const STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT


	public enum DebugReportObjectTypeEXT {
		UNKNOWN_EXT,
		INSTANCE_EXT,
		PHYSICAL_DEVICE_EXT,
		DEVICE_EXT,
		QUEUE_EXT,
		SEMAPHORE_EXT,
		COMMAND_BUFFER_EXT,
		FENCE_EXT,
		DEVICE_MEMORY_EXT,
		BUFFER_EXT,
		IMAGE_EXT,
		EVENT_EXT,
		QUERY_POOL_EXT,
		BUFFER_VIEW_EXT,
		IMAGE_VIEW_EXT,
		SHADER_MODULE_EXT,
		PIPELINE_CACHE_EXT,
		PIPELINE_LAYOUT_EXT,
		RENDER_PASS_EXT,
		PIPELINE_EXT,
		DESCRIPTOR_SET_LAYOUT_EXT,
		SAMPLER_EXT,
		DESCRIPTOR_POOL_EXT,
		DESCRIPTOR_SET_EXT,
		FRAMEBUFFER_EXT,
		COMMAND_POOL_EXT,
		SURFACE_KHR_EXT,
		SWAPCHAIN_KHR_EXT,
		DEBUG_REPORT_EXT,
	}

	public enum DebugReportErrorEXT {
		ERROR_NONE_EXT,
		ERROR_CALLBACK_REF_EXT,
	}


	[Flags]
	public enum DebugReportFlagsEXT {
		INFORMATION_BIT_EXT,
		WARNING_BIT_EXT,
		PERFORMANCE_WARNING_BIT_EXT,
		ERROR_BIT_EXT,
		DEBUG_BIT_EXT,
	}

	public delegate bool PFN_vkDebugReportCallbackEXT (
		DebugReportFlagsEXT      flags,
		DebugReportObjectTypeEXT objectType,
		uint64                   object,
		size_t                   location,
		int32                    messageCode,
		string                   pLayerPrefi,
		string                   pMessage,
		void*                    pUserData);


	[CCode (has_type_id = false)]
	public struct DebugReportCallbackCreateInfoEXT {
		StructureType                sType;
		void*                        pNet;
		DebugReportFlagsEXT          flags;
		PFN_vkDebugReportCallbackEXT pfnCallback;
		void*                        pUserData;
	}

	public const int NV_glsl_shader;
	public const int NV_GLSL_SHADER_SPEC_VERSION;
	public const string NV_GLSL_SHADER_EXTENSION_NAME;


	public const int IMG_filter_cubic;
	public const int IMG_FILTER_CUBIC_SPEC_VERSION;
	public const string IMG_FILTER_CUBIC_EXTENSION_NAME;


	public const int AMD_rasterization_order;
	public const int AMD_RASTERIZATION_ORDER_SPEC_VERSION;
	public const string AMD_RASTERIZATION_ORDER_EXTENSION_NAME;


	public enum RasterizationOrderAMD
	{
		STRICT ,
		RELAXED,
	}

	[CCode (has_type_id = false)]
	public struct PipelineRasterizationStateRasterizationOrderAMD
	{
		StructureType         sType;
		void*                 pNet;
		RasterizationOrderAMD rasterizationOrder;
	}

	public const int AMD_shader_trinary_minma;
	public const int AMD_SHADER_TRINARY_MINMAX_SPEC_VERSION;
	public const string AMD_SHADER_TRINARY_MINMAX_EXTENSION_NAME;

	public const int AMD_shader_eplicit_verte_parameter;
	public const int AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_SPEC_VERSION;
	public const string AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_EXTENSION_NAME;

	public const int EXT_debug_marker;
	public const int EXT_DEBUG_MARKER_SPEC_VERSION;
	public const string EXT_DEBUG_MARKER_EXTENSION_NAME;

	[CCode (has_type_id = false)]
	public struct DebugMarkerObjectNameInfoEXT {
		StructureType            sType;
		void*                    pNet;
		DebugReportObjectTypeEXT objectType;
		uint64                   object;
		string                    pObjectName;
	}

	[CCode (has_type_id = false)]
	public struct DebugMarkerObjectTagInfoEXT {
		StructureType            sType;
		void*                    pNet;
		DebugReportObjectTypeEXT objectType;
		uint64                   object;
		uint64                   tagName;
		size_t                   tagSize;
		void*                    pTag;
	}

	[CCode (has_type_id = false)]
	public struct DebugMarkerMarkerInfoEXT {
		StructureType sType;
		void*         pNet;
		string        pMarkerName;
		float         color[4];
	}

	public const int    AMD_gcn_shader;
	public const int    AMD_GCN_SHADER_SPEC_VERSION;
	public const string AMD_GCN_SHADER_EXTENSION_NAME;

	public const int    NV_dedicated_allocation;
	public const int    NV_DEDICATED_ALLOCATION_SPEC_VERSION;
	public const string NV_DEDICATED_ALLOCATION_EXTENSION_NAME;

	[CCode (has_type_id = false)]
	public struct DedicatedAllocationImageCreateInfoNV
	{
		StructureType sType;
		void*         pNet;
		bool          dedicatedAllocation;
	}

	[CCode (has_type_id = false)]
	public struct DedicatedAllocationBufferCreateInfoNV
	{
		StructureType sType;
		void*         pNet;
		bool          dedicatedAllocation;
	}

	[CCode (has_type_id = false)]
	public struct DedicatedAllocationMemoryAllocateInfoNV
	{
		StructureType sType;
		void*         pNet;
		Image         image;
		Buffer        buffer;
	}
}
