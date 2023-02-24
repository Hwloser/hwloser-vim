# 为什么要设计一套针对vim的扩展性框架

---

## 对比框架

- SpaceVim
- LunarVim
- LazyVim

这几款框架中，一是大量摘用了vim-script，少量混合lua;另一个则是使用lua来构建，可组织结构已经不支持良好的扩展，以及配置很混乱，模块化极度不友好。

在作者使用了很长一段时间之后，因想定制化而感到烦躁。决心解决这些痛点，很好的抽象可以保证后人可以很愉悦轻松的找到对应的模块。

## 如何设计？

模块化设计，这里抽象几种模块

- [✅] bootstrap
- [✅] config manager
    - [✅] config file manager
    - [✅] extension plugins config manager
    - [✅] event hook config manager
    - [✅] command config manager
    - [✅] map config manager
- [✅] backend
    - [ ] telescope manager
    - [ ] lsp manager
    - [ ] dap manager
    - [ ] log manager
    - [ ] utilities manager
    - [ ] extension「plugins」 manager
- [ ] frontend
    - [ ] terminal UI
    - [ ] documents
    - [ ] web pages

## Notice

1. plugin manager: lazy.nvim. 这个插件作为submodule的模式跟进在external/lazy.nvim中。submodule有一个问题是，只能定义branch，然而lazy.nvim的stable是指定在tag中的。
