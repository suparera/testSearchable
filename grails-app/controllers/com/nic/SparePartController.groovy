package com.nic

import org.springframework.dao.DataIntegrityViolationException

class SparePartController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [sparePartInstanceList: SparePart.list(params), sparePartInstanceTotal: SparePart.count()]
    }

    def create() {
        [sparePartInstance: new SparePart(params)]
    }

    def save() {
        def sparePartInstance = new SparePart(params)
        if (!sparePartInstance.save(flush: true)) {
            render(view: "create", model: [sparePartInstance: sparePartInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sparePart.label', default: 'SparePart'), sparePartInstance.id])
        redirect(action: "show", id: sparePartInstance.id)
    }

    def show(Long id) {
        def sparePartInstance = SparePart.get(id)
        if (!sparePartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sparePart.label', default: 'SparePart'), id])
            redirect(action: "list")
            return
        }

        [sparePartInstance: sparePartInstance]
    }

    def edit(Long id) {
        def sparePartInstance = SparePart.get(id)
        if (!sparePartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sparePart.label', default: 'SparePart'), id])
            redirect(action: "list")
            return
        }

        [sparePartInstance: sparePartInstance]
    }

    def update(Long id, Long version) {
        def sparePartInstance = SparePart.get(id)
        if (!sparePartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sparePart.label', default: 'SparePart'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sparePartInstance.version > version) {
                sparePartInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sparePart.label', default: 'SparePart')] as Object[],
                          "Another user has updated this SparePart while you were editing")
                render(view: "edit", model: [sparePartInstance: sparePartInstance])
                return
            }
        }

        sparePartInstance.properties = params

        if (!sparePartInstance.save(flush: true)) {
            render(view: "edit", model: [sparePartInstance: sparePartInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sparePart.label', default: 'SparePart'), sparePartInstance.id])
        redirect(action: "show", id: sparePartInstance.id)
    }

    def delete(Long id) {
        def sparePartInstance = SparePart.get(id)
        if (!sparePartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sparePart.label', default: 'SparePart'), id])
            redirect(action: "list")
            return
        }

        try {
            sparePartInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sparePart.label', default: 'SparePart'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sparePart.label', default: 'SparePart'), id])
            redirect(action: "show", id: id)
        }
    }
}
