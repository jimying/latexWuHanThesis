# latexWuHanThesis

武汉大学研究生latex模板

此模板是根据https://code.google.com/archive/p/latex-phd-template/  
武大博士论文的模板进行修改的，以满足研究生模板的需求。  
刚刚接触latex， 有不足之处还请谅解。  


国内其他大学latex模板项目都有维护, 如同济大学，而武大却没有专门的组织来维护一套统一的本科、硕士、博士latex模板。  
如果能够有这样的一个模板， 学生们写毕业论文就会非常方便。  

本人是武大在职研究生一枚， 工作比较忙， word写毕业论文格式调整很繁琐，用latex可以方便的做到格式统一。  
经过多天的努力，终于修改完成了这一个版本的latex模板。  
但是由于我对latex的认识还很少， 可能还存在很多格式的错误。  
希望各位武大的朋友进行指证。  



----------
1. 环境：  
    linux + texlive2009 +gbk2uni  
    （我用centos7测试通过了）  

    1) gbk2uni：https://github.com/CTeX-org/ctex-kit/tree/master/gbk2uni  
        解决生成pdf书签乱码问题  

    2）texlive2009: http://thinfilm.ustc.edu.cn/~liangzi/software/CTeXlive/  
        完整的texlive的安装包， 包含了中文字体。 也可自己安装全部的texlive包  



2. 生成PDF：  
    执行sh build.sh  

