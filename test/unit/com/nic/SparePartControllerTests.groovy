package com.nic



import org.junit.*
import grails.test.mixin.*

@TestFor(SparePartController)
@Mock(SparePart)
class SparePartControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sparePart/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sparePartInstanceList.size() == 0
        assert model.sparePartInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.sparePartInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sparePartInstance != null
        assert view == '/sparePart/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sparePart/show/1'
        assert controller.flash.message != null
        assert SparePart.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sparePart/list'

        populateValidParams(params)
        def sparePart = new SparePart(params)

        assert sparePart.save() != null

        params.id = sparePart.id

        def model = controller.show()

        assert model.sparePartInstance == sparePart
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sparePart/list'

        populateValidParams(params)
        def sparePart = new SparePart(params)

        assert sparePart.save() != null

        params.id = sparePart.id

        def model = controller.edit()

        assert model.sparePartInstance == sparePart
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sparePart/list'

        response.reset()

        populateValidParams(params)
        def sparePart = new SparePart(params)

        assert sparePart.save() != null

        // test invalid parameters in update
        params.id = sparePart.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sparePart/edit"
        assert model.sparePartInstance != null

        sparePart.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sparePart/show/$sparePart.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sparePart.clearErrors()

        populateValidParams(params)
        params.id = sparePart.id
        params.version = -1
        controller.update()

        assert view == "/sparePart/edit"
        assert model.sparePartInstance != null
        assert model.sparePartInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sparePart/list'

        response.reset()

        populateValidParams(params)
        def sparePart = new SparePart(params)

        assert sparePart.save() != null
        assert SparePart.count() == 1

        params.id = sparePart.id

        controller.delete()

        assert SparePart.count() == 0
        assert SparePart.get(sparePart.id) == null
        assert response.redirectedUrl == '/sparePart/list'
    }
}
