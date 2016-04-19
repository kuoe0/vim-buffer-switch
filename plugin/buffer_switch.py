#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2016 KuoE0 <kuoe0.tw@gmail.com>
#
# Distributed under terms of the MIT license.

"""

"""
import vim

def get_filetype():
    return vim.eval('&ft')

def buffer_switch_next():
    if get_filetype() in vim.eval('g:buffer_switch_not_in_filetype'):
        print "Do not switch buffer in this window!"
        return
    vim.command('bnext')
    return

def buffer_switch_previous():
    if get_filetype() in vim.eval('g:buffer_switch_not_in_filetype'):
        print "Do not switch buffer in this window!"
        return
    vim.command('bprevious')
    return
