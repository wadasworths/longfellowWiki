###检查GPU

-[支持CUDA的GPU列表](https://developer.nvidia.com/cuda-gpus)

###安装CUDA

-[下载CUDA](https://developer.nvidia.com/cuda-downloads)

注：我下载的版本是9.1
在CMD中查看
ncvv -V

https://www.linuxidc.com/Linux/2016-12/138862.htm

https://blog.csdn.net/w7256037/article/details/52153279

```
C:\Users\longfellow>nvcc -V
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2017 NVIDIA Corporation
Built on Fri_Nov__3_21:08:12_Central_Daylight_Time_2017
Cuda compilation tools, release 9.1, V9.1.85
```

C:\ProgramData\NVIDIA Corporation\CUDA Samples\v9.1
编译安装CUDA自带的samples

报错：找不到 Windows SDK 版本10.0.15063.0。请安装所需的版本的 Windows SDK 或者在项目属性页中或通过右键单击解决方案并选择“重定解决方案目标”来更改 SDK 版本。

获取SDK版本

https://developer.microsoft.com/zh-cn/windows/downloads/sdk-archive

解决方案1：
https://blog.csdn.net/lovelessyi/article/details/79219276
https://devtalk.nvidia.com/default/topic/1031665/?comment=5248647
https://stackoverflow.com/questions/43704734/how-to-fix-the-error-windows-sdk-version-8-1-was-not-found

###报错一
解决方案：
安装出现问题。

可通过以下方式排查包故障问题:

    1. 使用以下搜索 URL 来搜索针对每个包故障的解决方案
    2. 针对受与影响的工作负荷或组件修改选项，然后重新尝试安装
    3. 从计算机上删除产品，然后再次安装

如果 Developer Community 上已报告了此问题，则可在此处找到解决方案或变通方法。如果未报告此问题，我们鼓励你创建新问题，以便其他开发者可以找到解决方案或变通方法。可使用“提供反馈”按钮从右上角的 Visual Studio 安装程序中创建新问题。

================================================================================

未能安装包“Win10SDK_10.0.10586.212,version=10.0.10586.21217”。
    搜索 URL
        https://aka.ms/VSSetupErrorReports?q=PackageId=Win10SDK_10.0.10586.212;PackageAction=Install;ReturnCode=15605
    详细信息
        已执行的命令: "c:\windows\syswow64\\windowspowershell\v1.0\powershell.exe" -NonInteractive -NoLogo -NoProfile -ExecutionPolicy Bypass -InputFormat None "$ErrorActionPreference="""Stop"""; $VerbosePreference="""Continue"""; $CeipSetting="""on"""; $ScriptPath="""C:\ProgramData\Microsoft\VisualStudio\Packages\Win10SDK_10.0.10586.212,version=10.0.10586.21217\WinSdkInstall.ps1"""; $SetupExe="""sdksetup.exe"""; $SetupLogFolder="""standalonesdk"""; $PackageId="""Win10SDK_10.0.10586.212"""; $LogFile="""C:\Users\longfellow\AppData\Local\Temp\dd_setup_20180417143559_003_Win10SDK_10.0.10586.212.log"""; $SetupParameters="""/features OptionId.AvrfExternal OptionId.WindowsSoftwareDevelopmentKit OptionId.WindowsSoftwareLogoToolkit /quiet /norestart"""; $PayloadsNotYetDownloaded=1; (gc $ScriptPath | out-string) | Invoke-Expression; if (!$?) { exit 1603 } elseif ($LastExitCode) { exit $LastExitCode }"
        返回代码: 15605
        返回代码详细信息: 下载你的产品时出错。
    日志
        C:\Users\longfellow\AppData\Local\Temp\dd_setup_20180417143559_003_Win10SDK_10.0.10586.212.log
    工作负荷受到影响
        使用 C++ 的桌面开发 (Microsoft.VisualStudio.Workload.NativeDesktop,version=15.0.27102.0)
        通用 Windows 平台开发 (Microsoft.VisualStudio.Workload.Universal,version=15.0.27128.1)
    组件受到影响
        Windows 10 SDK (10.0.10586.0) (Microsoft.VisualStudio.Component.Windows10SDK.10586,version=15.0.26208.0)


###报错二
安装出现问题。

可通过以下方式排查包故障问题:

    1. 使用以下搜索 URL 来搜索针对每个包故障的解决方案
    2. 针对受与影响的工作负荷或组件修改选项，然后重新尝试安装
    3. 从计算机上删除产品，然后再次安装

如果 Developer Community 上已报告了此问题，则可在此处找到解决方案或变通方法。如果未报告此问题，我们鼓励你创建新问题，以便其他开发者可以找到解决方案或变通方法。可使用“提供反馈”按钮从右上角的 Visual Studio 安装程序中创建新问题。

================================================================================

未能从“https://download.visualstudio.microsoft.com/download/pr/100203889/8957d1e7f78d255cd07742608714db46/f9b24c8280986c0683fbceca5326d806.cab”下载包“Win10SDK_10.0.15063,version=10.0.15063.1”。
    搜索 URL
        https://aka.ms/VSSetupErrorReports?q=PackageId=Win10SDK_10.0.15063;PackageAction=DownloadPackage;ReturnCode=0x80096004
    详细信息
        WebClient 下载失败: “f9b24c8280986c0683fbceca5326d806.cab”的 SHA256 验证失败。预期哈希: 12CDEEAF77F373B3ACCEB24746CD48794DCD8E2563EDC81586949400DE7EB80C，实际哈希: D1EDC85D84BF5A99DD6984036CBA3C9C65CF03BF738AC15D9E8721D47261E1BC
        Bits 下载失败: 找不到文件。
        WinInet 下载失败: “f9b24c8280986c0683fbceca5326d806.cab”的 SHA256 验证失败。预期哈希: 12CDEEAF77F373B3ACCEB24746CD48794DCD8E2563EDC81586949400DE7EB80C，实际哈希: D1EDC85D84BF5A99DD6984036CBA3C9C65CF03BF738AC15D9E8721D47261E1BC
    工作负荷受到影响
        使用 C++ 的桌面开发 (Microsoft.VisualStudio.Workload.NativeDesktop,version=15.0.27102.0)
        通用 Windows 平台开发 (Microsoft.VisualStudio.Workload.Universal,version=15.0.27128.1)
    组件受到影响
        适用于 UWP 的 Windows 10 SDK (10.0.15063.0): C#、VB、JS (Microsoft.VisualStudio.Component.Windows10SDK.15063.UWP,version=15.0.27128.1)
        适用于 UWP 的 Windows 10 SDK (10.0.15063.0): C++ (Microsoft.VisualStudio.Component.Windows10SDK.15063.UWP.Native,version=15.0.27128.1)
        用于桌面 C++ [x86 和 x64]的 Windows 10 SDK (10.0.15063.0)  (Microsoft.VisualStudio.Component.Windows10SDK.15063.Desktop,version=15.0.27128.1)

###报错三：
162>cudaTensorCoreGemm.cu
162>C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\VC\VCTargets\BuildCustomizations\CUDA 9.1.targets(707,9): error MSB3721: 命令“"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.1\bin\nvcc.exe" -gencode=arch=compute_70,code=\"sm_70,compute_70\" --use-local-env --cl-version 2017 -ccbin "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Tools\MSVC\14.13.26128\bin\HostX86\x64" -x cu  -I./ -I../../common/inc -I./ -I"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.1\/include" -I../../common/inc -I"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.1\include"     --keep-dir x64\Release -maxrregcount=0  --machine 64 --compile -cudart static -Xcompiler "/wd 4819"    -DWIN32 -DWIN32 -D_MBCS -D_MBCS -Xcompiler "/EHsc /W3 /nologo /O2 /FS /Zi  /MT " -o x64/Release/cudaTensorCoreGemm.cu.obj "C:\ProgramData\NVIDIA Corporation\CUDA Samples\v9.1\0_Simple\cudaTensorCoreGemm\cudaTensorCoreGemm.cu"”已退出，返回代码为 2。


###解决方案二：

VS2017 V141 换到VS2015 V140


###报错四：
无法打开包括文件
d3dx9.h
d3dx10
d3dx11.h
mpi.h
###解决方案
https://www.microsoft.com/en-us/download/details.aspx?id=6812%20%20

下载安装


C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include


C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Lib\x64


###Mask R-CNN入门

https://blog.csdn.net/u011974639/article/details/78483779#t1



###Tensorflow测试

The TensorFlow library wasn't compiled to use AVX instructions, but these are available on your machine and could speed up CPU computations.


###报错五

https://blog.csdn.net/chuchus/article/details/51713389
https://stackoverflow.com/questions/42463594/cpu-instructions-not-compiled-with-tensorflow

The TensorFlow library wasn't compiled to use AVX instructions, but these are available on your machine and could speed up CPU computations.
原因是pip安装的是预编译 tensorflow 库, 没有针对当前的cpu体系进行优化

###解决方案

https://blog.csdn.net/chuchus/article/details/51713389


https://stackoverflow.com/questions/45952049/tensorflow-library-wasnt-compiled-to-use-sse4-2-avx-avx2-fma-in-pycharm

###Mask R-CNN入门


https://blog.csdn.net/happyhorizion/article/details/77894205#coco

https://www.jianshu.com/p/de455d653301


###GPU测试

https://blog.csdn.net/louishao/article/details/78827691


https://stackoverflow.com/questions/41293077/how-to-compile-tensorflow-with-sse4-2-and-avx-instructions


https://www.tensorflow.org/install/install_sources



-[语音识别](https://blog.csdn.net/snowdroptulip/article/details/78943748)
http://www.openslr.org/18/


###报错六
ImportError: No module named '_pywrap_tensorflow_internal'


https://blog.csdn.net/u010099080/article/details/53418159


https://blog.csdn.net/u010099080/article/details/53418159


###报错信息
Traceback (most recent call last):
  File "C:\Python35\lib\site-packages\tensorflow\python\pywrap_tensorflow_internal.py", line 18, in swig_import_helper
    return importlib.import_module(mname)
  File "C:\Python35\lib\importlib\__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 986, in _gcd_import
  File "<frozen importlib._bootstrap>", line 969, in _find_and_load
  File "<frozen importlib._bootstrap>", line 958, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 666, in _load_unlocked
  File "<frozen importlib._bootstrap>", line 577, in module_from_spec
  File "<frozen importlib._bootstrap_external>", line 903, in create_module
  File "<frozen importlib._bootstrap>", line 222, in _call_with_frames_removed
ImportError: DLL load failed: 找不到指定的模块。

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "C:\Python35\lib\site-packages\tensorflow\python\pywrap_tensorflow.py", line 41, in <module>
    from tensorflow.python.pywrap_tensorflow_internal import *
  File "C:\Python35\lib\site-packages\tensorflow\python\pywrap_tensorflow_internal.py", line 21, in <module>
    _pywrap_tensorflow_internal = swig_import_helper()
  File "C:\Python35\lib\site-packages\tensorflow\python\pywrap_tensorflow_internal.py", line 20, in swig_import_helper
    return importlib.import_module('_pywrap_tensorflow_internal')
  File "C:\Python35\lib\importlib\__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
ImportError: No module named '_pywrap_tensorflow_internal'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "C:\Python35\lib\site-packages\tensorflow\__init__.py", line 24, in <module>
    from tensorflow.python import *
  File "C:\Python35\lib\site-packages\tensorflow\python\__init__.py", line 49, in <module>
    from tensorflow.python import pywrap_tensorflow
  File "C:\Python35\lib\site-packages\tensorflow\python\pywrap_tensorflow.py", line 52, in <module>
    raise ImportError(msg)
ImportError: Traceback (most recent call last):
  File "C:\Python35\lib\site-packages\tensorflow\python\pywrap_tensorflow_internal.py", line 18, in swig_import_helper
    return importlib.import_module(mname)
  File "C:\Python35\lib\importlib\__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 986, in _gcd_import
  File "<frozen importlib._bootstrap>", line 969, in _find_and_load
  File "<frozen importlib._bootstrap>", line 958, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 666, in _load_unlocked
  File "<frozen importlib._bootstrap>", line 577, in module_from_spec
  File "<frozen importlib._bootstrap_external>", line 903, in create_module
  File "<frozen importlib._bootstrap>", line 222, in _call_with_frames_removed
ImportError: DLL load failed: 找不到指定的模块。

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "C:\Python35\lib\site-packages\tensorflow\python\pywrap_tensorflow.py", line 41, in <module>
    from tensorflow.python.pywrap_tensorflow_internal import *
  File "C:\Python35\lib\site-packages\tensorflow\python\pywrap_tensorflow_internal.py", line 21, in <module>
    _pywrap_tensorflow_internal = swig_import_helper()
  File "C:\Python35\lib\site-packages\tensorflow\python\pywrap_tensorflow_internal.py", line 20, in swig_import_helper
    return importlib.import_module('_pywrap_tensorflow_internal')
  File "C:\Python35\lib\importlib\__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
ImportError: No module named '_pywrap_tensorflow_internal'


Failed to load the native TensorFlow runtime.

See https://www.tensorflow.org/install/install_sources#common_installation_problems

for some common reasons and solutions.  Include the entire stack trace
above this error message when asking for help.

###解决方案
https://stackoverflow.com/questions/42011070/on-windows-running-import-tensorflow-generates-no-module-named-pywrap-tenso