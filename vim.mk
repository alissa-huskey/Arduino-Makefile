
ifndef VIMRC
    ifdef SRCDIR
        VIMRC          := $(SRCDIR)/.vimrc
        $(call show_config_variable,VIMRC,[COMPUTED], (from SRCDIR))
    else
        VIMRC          := $(PWD)/.vimrc
        $(call show_config_variable,VIMRC,[COMPUTED])
    endif
else
    $(call show_config_info,$(VIMRC))
    $(call show_config_variable,VIMRC,[USER])
endif

ifeq ($(abspath $(dir $(VIMRC) )), $(abspath $(HOME)))
    ORIGVIMRC          := $(VIMRC)
    VIMRC              := $(PWD)/vimrc
    $(call show_config_variable,VIMRC,[DEFAULT])
    $(call show_config_info,Refusing to write to $(ORIGVIMRC) in $$HOME)
endif


vim:
	@echo "if !exists(\"g:syntastic_cpp_include_dirs\")\nlet g:syntastic_cpp_include_dirs = []\n endif\n" > $(VIMRC)
	@echo "let g:syntastic_c_compiler='$(CC)'" >> $(VIMRC)
	@echo "let g:syntastic_cpp_compiler='$(CXX)'" >> $(VIMRC)
	@for l in $(ARDUINO_CORE_PATH) $(ARDUINO_VAR_PATH)/$(VARIANT) $(PLATFORM_LIBS) $(SYS_LIBS) $(USER_LIBS); do echo "let g:syntastic_cpp_include_dirs += [ \"$$l\" ]" >> $(VIMRC); done
	@echo "let g:syntastic_c_compiler_options = \"$(CFLAGS)\"" >> $(VIMRC)
	@echo "let g:syntastic_cpp_compiler_options = \"$(CPPFLAGS)\"" >> $(VIMRC)
	@echo "\n\nWritten to: $(VIMRC)"
