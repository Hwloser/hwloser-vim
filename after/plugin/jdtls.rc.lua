local status, jdtls = pcall(require, 'jdtls')
if not status then return end

local java_path_17 = '/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin/java'
local java_path_11 = '/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/bin/java'
-- local java_opts = '-Xms1g' .. ' -Xmx3g' .. ' -XX:+UseG1GC'
local java_opts = '-Xms1g'

local jdtls_install_dir = vim.fn.stdpath("config") .. '/jdtls_jar_path/'
-- local jdtls_jar_name = 'org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local jdtls_jar_name = 'org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'


-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach({
  -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.

  -- -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    -- 💀
    java_path_11,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    "-Xms1g",
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    -- add lombok plugins
    "-javaagent:" .. jdtls_install_dir .. 'lombok_jar/lombok.jar',
    "-Xbootclasspath/a:" .. jdtls_install_dir .. 'lombok_jar/lombok.jar',

    -- 💀
    '-jar', jdtls_install_dir .. 'plugins/' .. jdtls_jar_name,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    '-configuration', jdtls_install_dir .. 'config_mac',
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    '-data', jdtls_install_dir .. 'workspace'
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
})
