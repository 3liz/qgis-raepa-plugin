"""
/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""

__author__ = '3liz'
__date__ = '2019-02-15'
__copyright__ = '(C) 2019 by 3liz'

from typing import Any, List, Tuple, Union

from qgis.core import QgsProviderConnectionException, QgsProviderRegistry


def fetch_data_from_sql_query(connection_name: str, sql: str) -> Union[Tuple[Any, None], Tuple[List[Any], str]]:
    """Execute SQL and return the result."""
    metadata = QgsProviderRegistry.instance().providerMetadata('postgres')
    connection = metadata.findConnection(connection_name)
    try:
        result = connection.executeSql(sql)
        return result, None
    except QgsProviderConnectionException as e:
        return [], str(e)


def validateTimestamp(timestamp_text):
    from dateutil.parser import parse
    valid = True
    msg = ''
    try:
        parse(timestamp_text)
    except ValueError as e:
        valid = False
        msg = str(e)
    return valid, msg
