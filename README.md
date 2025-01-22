# Objective-C KVO Crash: Failure to Remove Observer

This repository demonstrates a common but often overlooked issue in Objective-C related to Key-Value Observing (KVO) and memory management.  Failure to properly remove observers before the observed object is deallocated can lead to crashes due to accessing deallocated memory.

## The Problem

The `bug.m` file contains code that adds an observer but fails to remove it before the observed object is deallocated. This results in a crash (EXC_BAD_ACCESS) when the observed object's memory is freed.

## The Solution

The `bugSolution.m` file provides the corrected code. The key change is the addition of `removeObserver:forKeyPath:` in the `dealloc` method to ensure the observer is removed before the object is deallocated.