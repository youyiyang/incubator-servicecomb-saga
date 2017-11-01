<%--
  ~   Copyright 2017 Huawei Technologies Co., Ltd
  ~
  ~   Licensed under the Apache License, Version 2.0 (the "License");
  ~   you may not use this file except in compliance with the License.
  ~   You may obtain a copy of the License at
  ~
  ~      http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~   Unless required by applicable law or agreed to in writing, software
  ~   distributed under the License is distributed on an "AS IS" BASIS,
  ~   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~   See the License for the specific language governing permissions and
  ~   limitations under the License.
  --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Request</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" href="request.css" type="text/css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-switch.min.css" type="text/css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-multiselect.css" type="text/css">
    <script src="assets/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap-switch.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap-multiselect.js"></script>
    <script src="assets/request.js"></script>
</head>
<body>
<ul id="nav">
    <li><a href="request.jsp">Request</a></li>
    <li><a href="result.jsp">Result</a></li>
    <li><a href="#">About</a></li>
</ul>

<div class="container-fluid">
    <h3>Send a new Saga Request</h3>
    <div class="row">
        <div class="col-sm-8"></div>
        <div class="row">
            <div class="col-sm-2">
                <h4>Text <input type="checkbox" id="text-switch"></h4>
            </div>
            <div class="col-sm-1">
                <button id="reset" type="button" class="btn btn-secondary btn-lg">Reset</button>
            </div>
        </div>

        <div id="view-content">
            <form>
                <div class="form-row col-lg-12">
                    <div class="form-group col-lg-12">
                        <div class="col-lg-1">
                            <label for="policyName">Policy</label>
                        </div>
                        <div class="col-lg-2">
                            <select id="policyName" class="form-control">
                                <option selected>BackwardRecovery</option>
                                <option>ForwardRecovery</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-lg-12">
                        <div class="col-lg-1">
                            <label for="policyName">Requests</label>
                        </div>
                        <div class="col-lg-2">
                            <button type="button" class="btn btn-primary" id="addRequest">Add a new request</button>
                            <div class="modal fade" id="requestModal" tabindex="-1" role="dialog" aira-labelledby="requestModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="requestModalLabel">New request</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group row">
                                                    <label for="id" class="col-sm-3 col-form-label">ID</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="id">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="type" class="col-sm-3 col-form-label">Type</label>
                                                    <div class="col-sm-9">
                                                        <select id="type" class="form-control">
                                                            <option value="rest" selected>rest</option>
                                                            <option value="NOP">NOP</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="service-name" class="col-sm-3 col-form-label">Service Name</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="service-name">
                                                    </div>
                                                </div>
                                                <h4>Transaction:</h4>
                                                <div class="form-group row">
                                                    <label for="transaction-method" class="col-sm-3 col-form-label">Method</label>
                                                    <div class="col-sm-9">
                                                        <select id="transaction-method" class="form-control">
                                                            <option value="put" selected>put</option>
                                                            <option value="post">post</option>
                                                            <option value="get">get</option>
                                                            <option value="delete">delete</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="transaction-path" class="col-sm-3 col-form-label">Path</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="transaction-path">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="transaction-params-btn" class="col-sm-3 col-form-label">Params</label>
                                                    <div class="col-sm-9">
                                                        <button type="button" class="btn btn-primary" id="transaction-params-btn">Add a parameter</button>
                                                    </div>
                                                </div>
                                                <table class="table" id="transaction-params">
                                                </table>
                                                <h4>Compensation:</h4>
                                                <div class="form-group row">
                                                    <label for="compensation-method" class="col-sm-3 col-form-label">Method</label>
                                                    <div class="col-sm-9">
                                                        <select id="compensation-method" class="form-control">
                                                            <option value="post" selected>post</option>
                                                            <option value="put">put</option>
                                                            <option value="get">get</option>
                                                            <option value="delete">delete</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="compensation-path" class="col-sm-3 col-form-label">Path</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="compensation-path">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="compensation-params-btn" class="col-sm-3 col-form-label">Params</label>
                                                    <div class="col-sm-9">
                                                        <button type="button" class="btn btn-primary" id="compensation-params-btn">Add a parameter</button>
                                                    </div>
                                                </div>
                                                <table class="table" id="compensation-params">
                                                </table>
                                                <div class="form-group row">
                                                    <label for="parents-btn" class="h4 col-sm-3 col-form-label">Parents:</label>
                                                    <div class="col-sm-9">
                                                        <select id="parents" multiple="multiple">
                                                        </select>
                                                        <!-- <button type="button" class="btn btn-primary" id="parents-btn">Add a parent</button> -->
                                                    </div>
                                                </div>
                                                <!-- <table class="table" id="parents"> -->
                                                <!-- </table> -->
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary" id="saveRequest">Save</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table" id="requests">
                        <thead><th>Id</th><th>Type</th><th>Service Name</th><th>View</th><th>Remove</th></thead>
                    </table>
                </div>
            </form>
        </div>

        <div id="text-content" hidden>
            <textarea id="content" style="width:800px;height:600px;"></textarea>
        </div>

        <br>
        <div id="v_loading" class="loading hide"><span></span></div>

        <form>
            <div class="form-row col-lg-12">
                <div class="form-row col-lg-4 col-md-8">
                    <div class="input-group">
                        <input id="submit-url" type="url" class="form-control" value="http://localhost:8080/requests">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="button" id="send-request">Submit</button>
                        </span>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
